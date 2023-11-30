import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/video_lib/models/video_album_model.dart';

class VideoAlbumRepository extends GetxController {
  static VideoAlbumRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<List<VideoAlbumModel>> getAllPhotoAlbum() async {
    final snapshot = await _db
        .collection('MediaAlbum')
        .doc('VideoAlbum')
        .collection('Album')
        .get();
    final albumData =
        snapshot.docs.map((e) => VideoAlbumModel.fromSnapShot(e)).toList();

    return albumData;
  }

  Future<void> createPhotosAlbum(VideoAlbumModel model) async {
    await _db
        .collection('MediaAlbum')
        .doc('VideoAlbum')
        .collection('Album')
        .add(
          model.toJson(),
        )
        .whenComplete(
          () => Get.snackbar(
            'Thành công',
            'Bạn đã đăng báo thành công',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green,
          ),
        )
        // ignore: body_might_complete_normally_catch_error
        .catchError(
      (error, stacktrace) {
        () => Get.snackbar(
              'Lỗi',
              'Có gì đó không đúng, thử lại?',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.redAccent.withOpacity(0.1),
              colorText: Colors.red,
            );
        if (kDebugMode) {
          print(error.toString());
        }
        throw error;
      },
    );
  }
}
