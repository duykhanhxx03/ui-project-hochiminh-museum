import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/home/widgets/web_view_container.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

import 'widgets/three_dimension_museum_preview.dart';

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
