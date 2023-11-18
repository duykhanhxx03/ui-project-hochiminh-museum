import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/video_lib/models/list_vid.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/video_lib/widget/new_vid.dart';

class VideoListView extends StatefulWidget {
  final List<ListVideo> videoDataList;

  const VideoListView({
    Key? key,
    required this.videoDataList,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VideoListViewState createState() => _VideoListViewState();
}

class _VideoListViewState extends State<VideoListView> {
  final int videosPerPage = 5;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              // List videos
              ..._buildVideoList(),
            ],
          ),
        ),

        // Phân trang
        _buildPaginationContainer(),
        const SizedBox(height: 16.0),
      ],
    );
  }

  List<Widget> _buildVideoList() {
    final startIndex = currentPage * videosPerPage;
    final endIndex = (currentPage + 1) * videosPerPage;
    final visibleVideos = widget.videoDataList
        .sublist(startIndex, endIndex.clamp(0, widget.videoDataList.length));

    return visibleVideos.map((video) {
      return NewsVid(videoData: video);
    }).toList();
  }

  Widget _buildPaginationContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              currentPage = index;
            });
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              border: Border.all(),
              color: currentPage == index
                  ? const Color.fromARGB(255, 202, 83, 83)
                  : const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              (index + 1).toString(),
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }),
    );
  }

  int get totalPages {
    return (widget.videoDataList.length / videosPerPage).ceil();
  }
}
