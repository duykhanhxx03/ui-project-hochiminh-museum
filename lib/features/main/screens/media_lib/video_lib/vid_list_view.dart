import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/video_lib/models/video_album_model.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/video_lib/widget/new_vid.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/helpers/helper_functions.dart';

class VideoListView extends StatefulWidget {
  final List<VideoAlbumModel> videoDataList;

  const VideoListView({
    Key? key,
    required this.videoDataList,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VideoListViewState createState() => _VideoListViewState();
}

class _VideoListViewState extends State<VideoListView> {
  final int videosPerPage = (THelperFunctions.screenHeight() / 105 - 3).ceil();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            addAutomaticKeepAlives: true,
            shrinkWrap: true,
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
      return NewsVid(
        videoData: video,
        allVideos: widget.videoDataList,
      );
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
              color: currentPage == index
                  ? const Color.fromARGB(255, 202, 83, 83)
                  : const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Text(
              (index + 1).toString(),
              style: TextStyle(
                color: currentPage == index ? TColors.light : TColors.dark,
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
