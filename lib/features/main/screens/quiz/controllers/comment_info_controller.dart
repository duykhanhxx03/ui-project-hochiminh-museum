import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/features/main/models/test_exam_model.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/models/comment_info_model.dart';
import 'package:ui_project_hochiminh_museum/repository/comment_info_repository/comment_info_repository.dart';

class CommentInfoController extends GetxController {
  static CommentInfoController get instance => Get.find();
  final _commentInfoRepo = Get.put(CommentInfoRepository());

  createComment (CommentInfoModel commentInfoModel, String deThi) {
    _commentInfoRepo.createComment(commentInfoModel, deThi);
  }

  Future<List<CommentInfoModel>> getAllComment(String deThi) {
    return _commentInfoRepo.getAllComment(deThi);
  }
}