import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/indoor_map/controllers/indoor_map_controller.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/indoor_map/widgets/dropdown_button.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';
import 'package:ui_project_hochiminh_museum/utils/device/device_utility.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/helpers/helper_functions.dart';

class IndoorMapScreen extends StatefulWidget {
  const IndoorMapScreen({super.key});

  @override
  State<IndoorMapScreen> createState() => _IndoorMapScreenState();
}

class _IndoorMapScreenState extends State<IndoorMapScreen>
    with TickerProviderStateMixin {
  TransformationController transformationController =
      TransformationController();
  double screenWidth = 0;
  double screenHeight = 0;

  bool preventDuplicateOnPageChange = false;

  final indoorMapController = Get.put(IndoorMapController());

  Animation<Matrix4>? _animationMap;
  late final AnimationController _controllerMap;

  CarouselController carouselController = CarouselController();

  void _changeFloor(int value) {
    indoorMapController.changeFloor(value);
  }

  Matrix4 _getEndPostionMatrix4(double x, double y) {
    Matrix4 end = Matrix4(
      1,
      0,
      0,
      0,
      0,
      1,
      0,
      0,
      0,
      0,
      1,
      0,
      -(x - screenWidth / 2),
      -(y + 100 - screenHeight / 2),
      0,
      1,
    );
    return end;
  }

  void onAnimateReset() {
    transformationController.value = _animationMap!.value;
    if (!_controllerMap.isAnimating) {
      _animationMap!.removeListener(onAnimateReset);
      _animationMap = null;
      _controllerMap.reset();
    }
  }

  void animateMap(Matrix4? begin, Matrix4? end) {
    _controllerMap.reset();
    _animationMap = Matrix4Tween(
      begin: begin,
      end: end,
    ).animate(_controllerMap);
    _animationMap!.addListener(onAnimateReset);
    _controllerMap.forward();
  }

  @override
  void initState() {
    super.initState();
    _controllerMap = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _controllerMap.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: TAppBar(
        title: IndoorMapDropdownMenu(changeFloor: _changeFloor),
        leadingIcon: Iconsax.map,
      ),
      body: Obx(
        () => Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            GestureDetector(
              onTapUp: (TapUpDetails details) async {
                var tappedAt = transformationController.toScene(
                  details.localPosition,
                );
                Matrix4 end = _getEndPostionMatrix4(tappedAt.dx, tappedAt.dy);

                animateMap(transformationController.value, end);

                carouselController.animateToPage(
                  await indoorMapController.findRoomByPoint(tappedAt) - 1,
                );
                preventDuplicateOnPageChange = true;
              },
              child: InteractiveViewer(
                  constrained: false,
                  scaleEnabled: true,
                  maxScale: 0.8,
                  minScale: 0.3,
                  boundaryMargin: EdgeInsets.symmetric(
                      horizontal: screenWidth / 2, vertical: screenHeight / 2),
                  transformationController: transformationController,
                  onInteractionStart: (ScaleStartDetails scaleStartDetails) {},
                  onInteractionEnd: (ScaleEndDetails scaleEndDetails) {},
                  onInteractionUpdate:
                      (ScaleUpdateDetails scaleUpdateDetails) {},
                  child: Stack(
                    alignment: AlignmentDirectional.topStart,
                    children: [
                      Image.asset(indoorMapController.currentMapUrl.value),
                    ],
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: (screenHeight -
                        TDeviceUtils.getAppBarHeight() -
                        TDeviceUtils.getBottomNavigationBarHeight()) /
                    2,
              ),
              child: const Icon(
                Icons.arrow_drop_down_outlined,
                color: Color.fromARGB(255, 255, 17, 0),
                size: 55,
                shadows: [
                  Shadow(
                    color: Color.fromARGB(255, 255, 255, 255),
                    blurRadius: 2,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
            FutureBuilder(
              future: indoorMapController.loadAsset(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasData) {
                  final jsonData = jsonDecode(snapshot.data!);
                  var xy = jsonData['Datas'][0]['coords'].split(',');

                  double x = (int.parse(xy[0]) + int.parse(xy[2])) * 0.5;
                  double y = (int.parse(xy[1]) + int.parse(xy[3])) * 0.5;

                  Matrix4 end = _getEndPostionMatrix4(x, y);

                  animateMap(transformationController.value, end);

                  return CarouselSlider(
                    carouselController: carouselController,
                    items: [
                      ...jsonData['Datas']
                          .map(
                            (element) => Container(
                              height: 200,
                              width: 200,
                              padding: const EdgeInsets.all(4),
                              margin: const EdgeInsets.only(bottom: 4),
                              decoration: BoxDecoration(
                                color: isDark ? TColors.black : Colors.white,
                                border: Border.all(
                                  width: 5,
                                  color:
                                      const Color.fromARGB(255, 101, 101, 101),
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  var xy = element['coords'].split(',');

                                  double x =
                                      (int.parse(xy[0]) + int.parse(xy[2])) *
                                          0.5;
                                  double y =
                                      (int.parse(xy[1]) + int.parse(xy[3])) *
                                          0.5;

                                  Matrix4 end = _getEndPostionMatrix4(x, y);

                                  animateMap(
                                      transformationController.value, end);
                                  carouselController.animateToPage(
                                    int.parse(element['href'].split('_')[1]) -
                                        1,
                                  );
                                  preventDuplicateOnPageChange = true;
                                },
                                child: Center(
                                  child: element['image'] == null
                                      ? Column(
                                          children: [
                                            Text(
                                              element['Room'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge!
                                                  .copyWith(
                                                    color: isDark
                                                        ? TColors.white
                                                        : const Color.fromARGB(
                                                            255,
                                                            101,
                                                            101,
                                                            101,
                                                          ),
                                                  ),
                                            ),
                                            const SizedBox(
                                                height: TSizes.defaultSpace),
                                          ],
                                        )
                                      : Image(
                                          image: AssetImage(
                                            element['image'],
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ],
                    options: CarouselOptions(
                      autoPlay: false,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.4,
                      viewportFraction: 0.5,
                      aspectRatio: 2.5,
                      initialPage: 0,
                      onPageChanged: (index, reason) {},
                    ),
                    disableGesture: false,
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
