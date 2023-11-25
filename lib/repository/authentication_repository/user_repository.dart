import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ui_project_hochiminh_museum/features/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<UserModel> getUserDetails(String email) async {
    final snapshot = await _db
        .collection('Users')
        .where(
          'email',
          isEqualTo: email,
        )
        .get();

    final userData = snapshot.docs.map((e) => UserModel.fromSnapShot(e)).single;
    return userData;
  }

  Future<List<UserModel>> getAllUsers() async {
    final snapshot = await _db.collection('Users').get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapShot(e)).toList();

    return userData;
  }

  createUser(UserModel userModel) async {
    await _db
        .collection('Users')
        .add(userModel.toJson())
        .whenComplete(
          () => Get.snackbar(
            'Thành công',
            'Tài khoản của bạn đã được tạo',
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
}
