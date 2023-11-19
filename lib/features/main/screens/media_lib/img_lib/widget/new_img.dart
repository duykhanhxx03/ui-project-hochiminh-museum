import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/img_lib/models/list_img.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/img_lib/widget/img_gallery_scr.dart';

class NewsImg extends StatelessWidget {
  final ListImage imageData;

  const NewsImg({super.key, required this.imageData});

  void _navigateToImageGallery(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageGalleryScreen(
          imageData: imageData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // Thêm đường viền giữa các mục
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              // Xử lý sự kiện khi click vào ảnh
              _navigateToImageGallery(context);
            },
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      NetworkImage(imageData.imgURL[0]), // Sử dụng ảnh đầu tiên
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 8.0,
                    left: 8.0,
                    child: Container(
                      color: Colors.black.withOpacity(0.7),
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Số lượng ảnh: ${imageData.imgURL.length}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Title image
                Text(
                  imageData.imgTitle,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Ngày đăng: ${imageData.dateSubmitted.day}/${imageData.dateSubmitted.month}/${imageData.dateSubmitted.year}',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
