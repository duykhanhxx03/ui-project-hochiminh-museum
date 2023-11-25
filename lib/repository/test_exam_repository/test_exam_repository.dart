import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/features/main/models/test_exam_model.dart';

class TestExamRepository extends GetxController {
  static TestExamRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createTestExam(TestExamModel testExamModel) async {
    await _db
        .collection('KiemTra')
        .doc('DeThi1')
        .collection('BoCauHoi')
        .add(testExamModel.toJson())
        .whenComplete(
          () => Get.snackbar(
            'Thành công',
            '',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green,
          ),
        )
        // ignore: body_might_complete_normally_catch_error
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

  Future<List<TestExamModel>> getTestExamDetails(String deThi) async {
    final snapshot =
        await _db.collection('KiemTra').doc(deThi).collection('BoCauHoi').get();
    final testExamData =
        snapshot.docs.map((e) => TestExamModel.fromSnapShot(e)).toList();
    return testExamData;
  }
}
