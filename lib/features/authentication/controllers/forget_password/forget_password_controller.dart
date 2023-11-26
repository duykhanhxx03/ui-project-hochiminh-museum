import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/repository/authentication_repository/authentication_repository.dart';

class ForgetPasswordController extends GetxController {
  final email = TextEditingController();

  void forgetPassword() {
    AuthenticationRepository.instance.resetPassword(email.text);
  }
}
