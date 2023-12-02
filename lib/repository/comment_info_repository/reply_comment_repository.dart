
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/models/comment_info_model.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/models/reply_comment_model.dart';

class ReplyCommentRepository extends GetxController {
  static ReplyCommentRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createReplyComment(ReplyCommentModel replyCommentModel, String deThi) async {
    await _db
        .collection('KiemTra')
        .doc(deThi)
        .collection('ReplyComment')
        .add(replyCommentModel.toJson())
        .catchError((error, stacktrace) {
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
    });
  }

  Future<List<ReplyCommentModel>> getAllReplyComment(String deThi) async {
    final snapshot =
    await _db.collection('KiemTra').doc(deThi).collection('ReplyComment').get();
    final replyCommentData =
    snapshot.docs.map((e) => ReplyCommentModel.fromSnapShot(e)).toList();
    return replyCommentData;
  }
}