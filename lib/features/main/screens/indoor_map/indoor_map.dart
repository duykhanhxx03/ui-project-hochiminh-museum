import 'dart:async';
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/indoor_map/widgets/dropdown_button.dart';

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

  Animation<Matrix4>? _animationMap;
  late final AnimationController _controllerMap;

  CarouselController carouselController = CarouselController();

  Future<String> loadAsset() async {
    return await rootBundle
        .loadString('lib/features/main/screens/indoor_map/rooms.json');
  }

  Future<ImageInfo> getImageInfo(Image img) async {
    final c = Completer<ImageInfo>();
    img.image
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo i, bool _) {
      c.complete(i);
    }));
    return c.future;
  }

  printImageInfo() async {
    Image image = Image.asset('assets/images/indoor_map/map.png');
    ImageInfo info = await getImageInfo(image);
    // print(info.image.height);
  }

  otherGetImageInfo() async {
    final img = await rootBundle.load('assets/images/indoor_map/map.png');
    final decodedImage = await decodeImageFromList(img.buffer.asUint8List());
    // print(decodedImage.width);
    // print(decodedImage.height);
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

// Stop a running reset to home transform animation.
  // void _animateResetStop() {
  //   _controllerMap.stop();
  //   _animationMap?.removeListener(_onAnimateReset);
  //   _animationMap = null;
  //   _controllerMap.reset();
  // }

  // void _onInteractionStart(ScaleStartDetails details) {
  //   // If the user tries to cause a transformation while the reset animation is
  //   // running, cancel the reset animation.
  //   if (_controllerMap.status == AnimationStatus.forward) {
  //     _animateResetStop();
  //   }
  // }

  Future<int> findRoomByPoint(Offset p) async {
    //new dims: 1000 x 772
    final allRoom = jsonDecode(await loadAsset());
    int room = 0;
    for (var r in allRoom['Datas']) {
      final rArr = (r['coords'].split(','));
      double xMax = 0.0, xMin = 1000.0, yMax = 0.0, yMin = 772.0;

      for (var i = 0; i < rArr.length; i += 2) {
        if (xMax < double.parse(rArr[i])) xMax = double.parse(rArr[i]);
        if (xMin > double.parse(rArr[i])) xMin = double.parse(rArr[i]);
      }

      for (var i = 1; i < rArr.length; i += 2) {
        if (yMax < double.parse(rArr[i])) yMax = double.parse(rArr[i]);
        if (yMin > double.parse(rArr[i])) yMin = double.parse(rArr[i]);
      }

      if (p.dx > xMin && p.dx < xMax && p.dy > yMin && p.dy < yMax) {
        room = int.parse(r['href'].split('_')[1]);
        break;
      }
    }

    return room;
  }

  @override
  void initState() {
    super.initState();
    _controllerMap = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    printImageInfo();
    otherGetImageInfo();
  }

  @override
  void dispose() {
    _controllerMap.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    debugPrint('build');
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Khám phá bảo tàng',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        leadingIcon: Iconsax.map,
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          GestureDetector(
            onTapUp: (TapUpDetails details) async {
              var tappedAt = transformationController.toScene(
                details.localPosition,
              );
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
                  -(tappedAt.dx - screenWidth / 2),
                  -(tappedAt.dy + 100 - screenHeight / 2),
                  0,
                  1);

              animateMap(transformationController.value, end);

              carouselController
                  .animateToPage(await findRoomByPoint(tappedAt) - 1);
              //
            },
            child: InteractiveViewer(
                constrained: false,
                scaleEnabled: true,
                minScale: 0.3,
                boundaryMargin: EdgeInsets.symmetric(
                    horizontal: screenWidth / 2, vertical: screenHeight / 2),
                transformationController: transformationController,
                onInteractionStart: (ScaleStartDetails scaleStartDetails) {
                  // print(
                  //     'Interaction Start - Focal point: ${scaleStartDetails.focalPoint}'
                  //     ', Local focal point: ${scaleStartDetails.localFocalPoint}');
                },
                onInteractionEnd: (ScaleEndDetails scaleEndDetails) {
                  // print(
                  //     'Interaction End - Velocity: ${scaleEndDetails.velocity}');
                },
                onInteractionUpdate: (ScaleUpdateDetails scaleUpdateDetails) {
                  // print(
                  //     'Interaction Update - Focal point: ${scaleUpdateDetails.focalPoint}'
                  //     ', Local focal point: ${scaleUpdateDetails.localFocalPoint}'
                  //     ', Scale: ${scaleUpdateDetails.scale}'
                  //     ', Horizontal scale: ${scaleUpdateDetails.horizontalScale}'
                  //     ', Vertical scale: ${scaleUpdateDetails.verticalScale}'
                  //     ', Rotation: ${scaleUpdateDetails.rotation}');
                },
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    Image.asset('assets/images/indoor_map/map.png'),
                    //dims: 1000 x 772 px
                    Positioned(
                      top: 50,
                      left: 50,
                      child: Container(
                        width: 20,
                        height: 20,
                        color: Colors.red.shade700.withAlpha(150),
                      ),
                    ),
                  ],
                )),
          ),
          // SizedBox(
          //   height: screenHeight + 220,
          // ),
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight / 2 + 10),
            child: Container(
              width: 20,
              height: 20,
              color: Colors.amber.shade700.withAlpha(150),
            ),
          ),

          FutureBuilder(
              future: loadAsset(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasData) {
                  final jsonData = jsonDecode(snapshot.data!);
                  return CarouselSlider(
                    carouselController: carouselController,
                    items: [
                      ...jsonData['Datas']
                          .map(
                            (e) => Container(
                              height: 200,
                              width: 200,
                              padding: const EdgeInsets.all(4),
                              margin: const EdgeInsets.only(bottom: 4),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Color.fromARGB(255, 109, 139, 146),
                              ),
                              child: InkWell(
                                onTap: () {
                                  //map dims: 1000 x 772 px

                                  var xy = e['coords'].split(',');

                                  // print(xy);

                                  double x =
                                      (int.parse(xy[0]) + int.parse(xy[2])) *
                                          0.5;
                                  double y =
                                      (int.parse(xy[1]) + int.parse(xy[3])) *
                                          0.5;

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
                                      1);

                                  animateMap(
                                      transformationController.value, end);
                                  carouselController.animateToPage(
                                      int.parse(e['href'].split('_')[1]) - 1);
                                },
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        e['Room'],
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                      const Divider(
                                        height: 1.0,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ],
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
                      aspectRatio: 2.0,
                      initialPage: 0,
                      onPageChanged: (index, reason) {
                        // print('index =  ${index}');
                      },
                    ),
                    disableGesture: false,
                  );
                }
                return const SizedBox();
              }),
          const Positioned(
            top: 10,
            right: 10,
            child: OKDropdownMenu(),
          ),
        ],
      ),
    );
  }
}
