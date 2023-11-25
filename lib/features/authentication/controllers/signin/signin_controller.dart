import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ui_project_hochiminh_museum/repository/authentication_repository/authentication_repository.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();
  var controller = Get.put(AuthenticationRepository());

  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();

  void signIn(String email, String password) {
    AuthenticationRepository.instance
        .loginUserWithEmailAndPassword(email, password);
  }
}
