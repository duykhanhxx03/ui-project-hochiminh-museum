import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/img_lib/models/photo_album_model.dart';
import 'package:ui_project_hochiminh_museum/repository/photo_album_repository/photo_album_repository.dart';

class CreatePhotoAlbumController extends GetxController {
  static CreatePhotoAlbumController get instance => Get.find();

  final _photoAlbumRepo = Get.put(PhotoAlbumRepository());
  final title = TextEditingController();
  final description = TextEditingController();
  RxList<dynamic> downloadImageURLs = [].obs;

  Future<void> uploadAlbumPhoto(List<XFile> imageFileList) async {
    await uploadImages(imageFileList);
    await _photoAlbumRepo.createPhotosAlbum(getContent());
  }

  PhotoAlbumModel getContent() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return PhotoAlbumModel(
      photos: downloadImageURLs,
      title: title.text,
      description: description.text,
      date: formatter.format(now),
    );
  }

  Future<void> uploadImages(List<XFile> imageFileList) async {
    List<String> cloudImageURLs = [];
    for (final imageFile in imageFileList) {
      String uniqueFileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';

      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child('images');

      Reference referenceImageToUpload =
          referenceDirImages.child(uniqueFileName);

      try {
        await referenceImageToUpload.putFile(File(imageFile.path));
        final cloudImageUrl = await referenceImageToUpload.getDownloadURL();
        cloudImageURLs.add(cloudImageUrl);
      } catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    }
    downloadImageURLs.value = cloudImageURLs;
  }
}
