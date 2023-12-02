import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/home/widgets/web_view_container.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

class MuseumThreeDimensionScreen extends StatefulWidget {
  const MuseumThreeDimensionScreen({super.key});

  @override
  State<MuseumThreeDimensionScreen> createState() =>
      _MuseumThreeDimensionScreenState();
}

class _MuseumThreeDimensionScreenState
    extends State<MuseumThreeDimensionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TAppBar(
          title: Text(
            'Bảo tàng 3D',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          showBackArrow: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ListView(
            children: <Widget>[
              ThreeDimensionMuseumPreview(
                imageUrl: "assets/images/illustrations/TrungBayCoDinh.png",
                title: "Trưng bày cố định của bảo tàng",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WebViewContainer(
                            url: "https://baotang.hochiminh.vn/"),
                      ));
                },
              ),
              ThreeDimensionMuseumPreview(
                imageUrl: "assets/images/illustrations/TrungBayKiVat.png",
                title: "Trưng bày chuyên đề: Mỗi kỷ vật một câu chuyện",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WebViewContainer(
                            url:
                                "https://demo-map.vietnaminfo.net/tours/bthcm/"),
                      ));
                },
              ),
              ThreeDimensionMuseumPreview(
                imageUrl: "assets/images/illustrations/TrungBayLeNin.png",
                title: "Trưng bày chuyên đề: Lênin và thời đại",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WebViewContainer(
                            url:
                                "https://demo.egal.vn/virtual-museum/baotanghcm2020/?utm_source=zalo&utm_medium=zalo&utm_campaign=zalo&zarsrc=30#%23"),
                      ));
                },
              ),
              ThreeDimensionMuseumPreview(
                imageUrl: "assets/images/illustrations/TrungBayNguoiDi.png",
                title: "Trưng bày chuyên đề: Người đi tìm hình của Nước",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WebViewContainer(
                            url: "http://baotanghochiminh.baotangao.com/"),
                      ));
                },
              ),
            ],
          ),
        ));
  }
}

class ThreeDimensionMuseumPreview extends StatelessWidget {
  const ThreeDimensionMuseumPreview({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onPressed,
  });

  final String imageUrl;
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 250,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.grey.withOpacity(0.4),
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.3),
                    Colors.grey.withOpacity(0.4),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        height: 1.25,
                        color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Row(
                      children: [
                        Text(
                          'Xem thêm',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(
                          Icons.arrow_right_alt,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
