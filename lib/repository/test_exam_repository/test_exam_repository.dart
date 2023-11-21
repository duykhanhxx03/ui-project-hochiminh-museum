import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/features/main/models/test_exam_model.dart';

class TestExamRepository extends GetxController{
  static TestExamRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // Future<TestExamModel> getTestExamDetails() async {
  //   final snapshot = await _db.collection('KiemTra').get();
  //   return null;
  // }
}