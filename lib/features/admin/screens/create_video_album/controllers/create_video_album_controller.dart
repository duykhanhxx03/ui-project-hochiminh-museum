import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/video_lib/models/video_album_model.dart';
import 'package:ui_project_hochiminh_museum/repository/video_album_repository/video_album_repository.dart';

class CreateVideoAlbumController extends GetxController {
  static CreateVideoAlbumController get instance => Get.find();
  final title = TextEditingController();
  final youtubeUrl = TextEditingController();

  final _videoAlbumRepo = Get.put(VideoAlbumRepository());

  Future<void> uploadAlbumVideo() async {
    await _videoAlbumRepo.createPhotosAlbum(getContent());
  }

  VideoAlbumModel getContent() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return VideoAlbumModel(
      date: formatter.format(now),
      youtubeUrl: youtubeUrl.text,
      title: title.text,
    );
  }
}
