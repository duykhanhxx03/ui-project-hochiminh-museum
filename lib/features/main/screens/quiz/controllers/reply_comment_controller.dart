import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/models/reply_comment_model.dart';
import 'package:ui_project_hochiminh_museum/repository/comment_info_repository/reply_comment_repository.dart';

class ReplyCommentController extends GetxController {
  static ReplyCommentController get instance => Get.find();
  final _replyCommentRepo = Get.put(ReplyCommentRepository());

  createReplyComment(ReplyCommentModel replyCommentModel, String deThi) {
    _replyCommentRepo.createReplyComment(replyCommentModel, deThi);
  }

  Future<List<ReplyCommentModel>> getAllReplyComment(String deThi) {
    return _replyCommentRepo.getAllReplyComment(deThi);
  }
}
