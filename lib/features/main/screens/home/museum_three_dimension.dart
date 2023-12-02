import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/home/widgets/web_view_container.dart';

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
        body: ListView(
          children: <Widget>[
            ElevatedCard(
              imagePath: "assets/images/illustrations/TrungBayCoDinh.png",
              title: "Trưng bày cố định của bảo tàng",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WebViewContainer(
                          url: "https://baotang.hochiminh.vn/"),
                    ));
              },
            ),
            ElevatedCard(
              imagePath: "assets/images/illustrations/TrungBayKiVat.png",
              title: "Trưng bày chuyên đề: Mỗi kỷ vật một câu chuyện",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WebViewContainer(
                          url: "https://demo-map.vietnaminfo.net/tours/bthcm/"),
                    ));
              },
            ),
            ElevatedCard(
              imagePath: "assets/images/illustrations/TrungBayLeNin.png",
              title: "Trưng bày chuyên đề: Lênin và thời đại",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WebViewContainer(
                          url:
                              "https://demo.egal.vn/virtual-museum/baotanghcm2020/?utm_source=zalo&utm_medium=zalo&utm_campaign=zalo&zarsrc=30#%23"),
                    ));
              },
            ),
            ElevatedCard(
              imagePath: "assets/images/illustrations/TrungBayNguoiDi.png",
              title: "Trưng bày chuyên đề: Người đi tìm hình của Nước",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WebViewContainer(
                          url: "http://baotanghochiminh.baotangao.com/"),
                    ));
              },
            ),
          ],
        ));
  }
}

class ElevatedCard extends StatelessWidget {
  final VoidCallback onTap;
  final String imagePath;
  final String title;

  const ElevatedCard(
      {Key? key,
      required this.onTap,
      required this.imagePath,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Card(
          child: SizedBox(
            width: 370,
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Ảnh illutration
                Expanded(
                  flex: 3,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                //Tiêu đề
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
