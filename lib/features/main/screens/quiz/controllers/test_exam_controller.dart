import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/features/main/models/test_exam_model.dart';
import 'package:ui_project_hochiminh_museum/repository/test_exam_repository/test_exam_repository.dart';

class TestExamController extends GetxController {
  static TestExamController get instance => Get.find();
  final _testExamRepo = Get.put(TestExamRepository());

  Future<List<TestExamModel>> getTestExamData(String deThi) {
    return _testExamRepo.getTestExamDetails(deThi);
  }
}