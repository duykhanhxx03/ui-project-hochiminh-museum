import 'package:flutter/material.dart';

import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/img_lib/data/img_list_data.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/img_lib/widget/new_img.dart';

class ImageLibScreen extends StatefulWidget {
  const ImageLibScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _ImageLibScreen createState() => _ImageLibScreen();
}

class _ImageLibScreen extends State<ImageLibScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 173, 7, 7),
            leading: BackButton(
              color: const Color.fromARGB(255, 255, 255, 255),
              onPressed: () {
                // Back về
              },
            ),
            title: const Text(
              'Thư viện ảnh',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true),
        body: const NewsListImg(),
      ),
    );
  }
}

class NewsListImg extends StatelessWidget {
  const NewsListImg({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ImageListData.listImageData.length,
      itemBuilder: (context, index) {
        return NewsImg(imageData: ImageListData.listImageData[index]);
      },
    );
  }
}
