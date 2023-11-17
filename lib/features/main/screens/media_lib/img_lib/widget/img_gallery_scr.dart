import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/img_lib/models/list_img.dart';

class ImageGalleryScreen extends StatelessWidget {
  final ListImage imageData;

  const ImageGalleryScreen({Key? key, required this.imageData})
      : super(key: key);

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
            'Thư viện ảnh',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              imageData.imgTitle,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Ngày đăng: ${imageData.dateSubmitted.day}/${imageData.dateSubmitted.month}/${imageData.dateSubmitted.year}',
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: imageData.imgURL.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print('zoom+vuot de next ');
                    // Zoom + vuốt sang ngang để chuyển sang hình khác
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(imageData.imgURL[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
