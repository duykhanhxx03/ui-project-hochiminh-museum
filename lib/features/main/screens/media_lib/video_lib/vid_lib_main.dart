import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/video_lib/data/vid_list_data.dart';
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
        body: VideoListView(videoDataList: VideoListData.listVideoData),
      ),
    );
  }
}
