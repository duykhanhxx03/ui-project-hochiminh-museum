import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/video_lib/models/video_album_model.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/video_lib/widget/ytb_vid_player.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/news/widgets/news_home/innotice_news.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

class VideoDetailScreen extends StatefulWidget {
  final VideoAlbumModel video;

  const VideoDetailScreen({
    Key? key,
    required this.video,
    required this.allVideos,
  }) : super(key: key);

  final List<VideoAlbumModel> allVideos;

  @override
  // ignore: library_private_types_in_public_api
  _VideoDetailScreenState createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen> {
  late List<VideoAlbumModel> randomVideos;

  @override
  void initState() {
    super.initState();
    randomVideos = getRandomVideos();
  }

// Random 4 video cho mục " Các video khác "
  List<VideoAlbumModel> getRandomVideos() {
    final Random random = Random();
    final List<VideoAlbumModel> allVideos = widget.allVideos;
    final List<VideoAlbumModel> filteredVideos =
        allVideos // filteredVideos để lọc ra những video có tiêu đề khác với video đang hiển thị
            .where((video) => video.title != widget.video.title)
            .toList();

    final List<VideoAlbumModel> selectedVideos = [];

    while (selectedVideos.length < 4 && filteredVideos.isNotEmpty) {
      final int randomIndex = random.nextInt(filteredVideos.length);
      final VideoAlbumModel randomVideo = filteredVideos[randomIndex];
      selectedVideos.add(randomVideo);
      filteredVideos.removeAt(randomIndex);
    }

    return selectedVideos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text(
          'Thư viện video',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.video.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              // 'Ngày đăng: ${widget.video.dateSubmitted.day}/${widget.video.dateSubmitted.month}/${widget.video.dateSubmitted.year}',
              'Ngày đăng: ${widget.video.date}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            // Hiển thị Player video
            VideoPlayerWidget(videoURL: widget.video.youtubeUrl),
            const SizedBox(height: TSizes.spaceBtwItems),
            const Divider(
              thickness: 1,
              indent: 0,
              endIndent: 0,
              color: Color.fromARGB(255, 191, 191, 191),
            ),
            const SizedBox(height: 8.0),

            const Text(
              'Các video khác:',
              style: TextStyle(
                fontSize: TSizes.lg,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            // Hiển thị danh sách video khác
            SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: randomVideos.length,
                itemBuilder: (context, index) {
                  final VideoAlbumModel videoData = randomVideos[index];
                  return InnoticeNews(
                    thumbnailUrl:
                        'https://img.youtube.com/vi/${videoData.youtubeUrl.split("/").last}/hqdefault.jpg',
                    title: videoData.title,
                    onPressed: () {
                      Get.to(
                        () => VideoDetailScreen(
                          video: videoData,
                          allVideos: widget.allVideos,
                        ),
                      );
                    },
                    isNetworkImage: true,
                    date: videoData.date,
                    isVideo: true,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
