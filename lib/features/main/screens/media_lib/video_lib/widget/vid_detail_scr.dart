import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/video_lib/data/vid_list_data.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/video_lib/models/list_vid.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/video_lib/widget/ytb_vid_player.dart';

class VideoDetailScreen extends StatefulWidget {
  final ListVideo video;

  const VideoDetailScreen({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VideoDetailScreenState createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen> {
  late List<ListVideo> randomVideos;

  @override
  void initState() {
    super.initState();
    randomVideos = getRandomVideos();
  }

// Random 4 video cho mục " Các video khác "
  List<ListVideo> getRandomVideos() {
    final Random random = Random();
    final List<ListVideo> allVideos = VideoListData.listVideoData;
    final List<ListVideo> filteredVideos =
        allVideos // filteredVideos để lọc ra những video có tiêu đề khác với video đang hiển thị
            .where((video) => video.vidTitle != widget.video.vidTitle)
            .toList();

    final List<ListVideo> selectedVideos = [];

    while (selectedVideos.length < 4 && filteredVideos.isNotEmpty) {
      final int randomIndex = random.nextInt(filteredVideos.length);
      final ListVideo randomVideo = filteredVideos[randomIndex];
      selectedVideos.add(randomVideo);
      filteredVideos.removeAt(randomIndex);
    }

    return selectedVideos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 173, 7, 7),
        leading: BackButton(
          color: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Thư viện video',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.video.vidTitle,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Ngày đăng: ${widget.video.dateSubmitted.day}/${widget.video.dateSubmitted.month}/${widget.video.dateSubmitted.year}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            // Hiển thị Player video
            VideoPlayerWidget(videoURL: widget.video.vidURL),
            const SizedBox(height: 16.0),
            const Divider(
              thickness: 1,
              indent: 0,
              endIndent: 0,
              color: Color.fromARGB(255, 107, 106, 106),
            ),
            const SizedBox(height: 8.0),

            const Text(
              'Các video khác:',
              style: TextStyle(
                fontSize: 24,
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
                  final ListVideo videoData = randomVideos[index];
                  return Container(
                    margin: const EdgeInsetsDirectional.only(bottom: 8.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    VideoDetailScreen(video: videoData),
                              ),
                            );
                          },
                          child: Container(
                            width: 120,
                            height: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://img.youtube.com/vi/${videoData.vidURL.split("/").last}/hqdefault.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                videoData.vidTitle,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'Ngày đăng: ${videoData.dateSubmitted.day}/${videoData.dateSubmitted.month}/${videoData.dateSubmitted.year}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
