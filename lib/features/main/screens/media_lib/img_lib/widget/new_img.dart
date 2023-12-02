import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/img_lib/models/photo_album_model.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/img_lib/widget/img_gallery_scr.dart';

class NewsImg extends StatelessWidget {
  final PhotoAlbumModel imageData;

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
                      NetworkImage(imageData.photos[0]), // Sử dụng ảnh đầu tiên
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
                        'Số lượng ảnh: ${imageData.photos.length}',
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
                  imageData.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    const Icon(
                      Iconsax.clock,
                      size: 10,
                      color: Colors.grey,
                    ),
                    Text(
                      ' ${imageData.date}',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
