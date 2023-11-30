import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/img_lib/controller/img_lib_controller.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/img_lib/models/photo_album_model.dart';
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
                Navigator.pop(context);
              },
            ),
            title: const Text(
              'Thư viện ảnh',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true),
        body: NewsListImg(),
      ),
    );
  }
}

class NewsListImg extends StatelessWidget {
  NewsListImg({super.key});
  final controller = Get.put(ImgLibController());

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //   itemCount: ImageListData.listImageData.length,
    //   itemBuilder: (context, index) {
    //     return NewsImg(imageData: ImageListData.listImageData[index]);
    //   },
    // );
    return FutureBuilder(
      future: controller.getAllPhotoAlbum(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final List<PhotoAlbumModel> list =
                snapshot.data as List<PhotoAlbumModel>;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return NewsImg(imageData: list[index]);
              },
            );
          }
        }
        return const SizedBox(
          height: 65,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
