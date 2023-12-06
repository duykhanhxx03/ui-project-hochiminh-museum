import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/video_lib/models/video_album_model.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/video_lib/widget/vid_detail_scr.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/news/widgets/news_home/innotice_news.dart';
import 'package:get/get.dart';

class NewsVid extends StatelessWidget {
  final VideoAlbumModel videoData;

  const NewsVid({Key? key, required this.videoData, required this.allVideos})
      : super(key: key);

  final List<VideoAlbumModel> allVideos;

  void _navigateToVideoDetail(BuildContext context) {
    Get.to(
      VideoDetailScreen(
        video: videoData,
        allVideos: allVideos,
      ),
      transition: Transition.cupertino,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InnoticeNews(
      thumbnailUrl:
          'https://img.youtube.com/vi/${videoData.youtubeUrl.split("/").last}/hqdefault.jpg',
      title: videoData.title,
      onPressed: () {
        _navigateToVideoDetail(context);
      },
      isNetworkImage: true,
      date: videoData.date,
      isVideo: true,
    );
  }
}
