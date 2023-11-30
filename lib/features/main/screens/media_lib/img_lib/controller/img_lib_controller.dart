import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/img_lib/models/photo_album_model.dart';
import 'package:ui_project_hochiminh_museum/repository/photo_album_repository/photo_album_repository.dart';

class ImgLibController extends GetxController {
  static ImgLibController get instance => Get.find();
  final _photoAlbumRepo = Get.put(PhotoAlbumRepository());
  Future<List<PhotoAlbumModel>> getAllPhotoAlbum() async {
    return await _photoAlbumRepo.getAllPhotoAlbum();
  }
}
