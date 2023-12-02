import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/video_lib/controllers/vid_lib_controller.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/video_lib/models/video_album_model.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/video_lib/vid_list_view.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

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
          appBar: const TAppBar(
            title: Text(
              'Thư viện video',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            showBackArrow: true,
          ),
          body: FutureBuilder(
            future: controller.getAllPhotoAlbum(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  final List<VideoAlbumModel> list =
                      snapshot.data as List<VideoAlbumModel>;

                  return Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: VideoListView(videoDataList: list),
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
          )),
    );
  }
}
// VideoListView(videoDataList: VideoListData.listVideoData),

