import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/video_lib/controllers/vid_lib_controller.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/video_lib/models/video_album_model.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/video_lib/vid_list_view.dart';

class VideoLibScreen extends StatefulWidget {
  const VideoLibScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _VideoLibScreen createState() => _VideoLibScreen();
}

/*
Trang chính thu vien video
*/
class _VideoLibScreen extends State<VideoLibScreen> {
  final controller = Get.put(VidLibController());
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
                'Thư viện video',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true),
          body: FutureBuilder(
            future: controller.getAllPhotoAlbum(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  final List<VideoAlbumModel> list =
                      snapshot.data as List<VideoAlbumModel>;

                  return VideoListView(videoDataList: list);
                }
              }
              return const SizedBox(
                height: 65,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          )),
    );
  }
}
// VideoListView(videoDataList: VideoListData.listVideoData),