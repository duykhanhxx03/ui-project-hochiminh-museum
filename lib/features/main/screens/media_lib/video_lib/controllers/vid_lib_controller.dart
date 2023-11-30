import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/video_lib/models/video_album_model.dart';
import 'package:ui_project_hochiminh_museum/repository/video_album_repository/video_album_repository.dart';

class VidLibController extends GetxController {
  static VidLibController get instance => Get.find();
  final _photoAlbumRepo = Get.put(VideoAlbumRepository());
  Future<List<VideoAlbumModel>> getAllPhotoAlbum() async {
    return await _photoAlbumRepo.getAllPhotoAlbum();
  }
}
