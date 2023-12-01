
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/models/comment_info_model.dart';

class CommentInfoRepository extends GetxController {
  static CommentInfoRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createComment(CommentInfoModel commentInfoModel, String deThi) async {
    await _db
        .collection('KiemTra')
        .doc(deThi)
        .collection('CommentInfo')
        .add(commentInfoModel.toJson())
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

  Future<List<CommentInfoModel>> getAllComment(String deThi) async {
    final snapshot =
    await _db.collection('KiemTra').doc(deThi).collection('CommentInfo').get();
    final commentInfoData =
    snapshot.docs.map((e) => CommentInfoModel.fromSnapShot(e)).toList();
    return commentInfoData;
  }

  // toggleLike(String userId, String deThi) async {
  //   final snapshot = await _db.collection('KiemTra').doc(deThi).collection('CommentInfo').get();
  //   final commentInfoData =
  //   snapshot.docs.map((e) => CommentInfoModel.fromSnapShot(e)).toList();
  //   if(commentInfoData.contains(userId)) {
  //     commentInfoData.remove(userId);
  //   } else {
  //     commentInfoData.add(userId);
  //   }
  // }
}