import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/features/authentication/models/user_model.dart';
import 'package:ui_project_hochiminh_museum/repository/authentication_repository/authentication_repository.dart';
import 'package:ui_project_hochiminh_museum/repository/authentication_repository/user_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  var controller = Get.put(AuthenticationRepository());

  var userRepo = Get.put(UserRepository());

  var isPasswordObscure = true.obs;
  var isRememberMe = true.obs;

  void showHiddenPassword() {}

  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();

  Future<void> registerUser(String email, String password) async {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  Future<bool> isDuplicateEmail() async {
    return controller.isDuplicateEmail();
  }

  createUser(UserModel userModel) {
    userRepo.createUser(userModel);
    registerUser(userModel.email, userModel.password);
  }
}
