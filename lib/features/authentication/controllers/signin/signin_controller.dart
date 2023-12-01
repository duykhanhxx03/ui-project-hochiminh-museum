import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ui_project_hochiminh_museum/repository/authentication_repository/authentication_repository.dart';
import 'package:ui_project_hochiminh_museum/repository/authentication_repository/user_repository.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();
  var controller = Get.put(AuthenticationRepository());
  var userRepo = Get.put(UserRepository());

  var deviceStorage = GetStorage('app-setting-configs');

  var isPasswordObscure = true.obs;
  var isRememberMe = true.obs;

  void showHiddenPassword() {}

  void rememberMe(bool isRememberMe) {}

  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    final savedEmail = deviceStorage.read('userEmail');
    email.text = savedEmail;
  }

  Future<void> signIn(String email, String password) async {
    if (isRememberMe.value) {
      await deviceStorage.write('userEmail', email);
    }
    await AuthenticationRepository.instance
        .loginUserWithEmailAndPassword(email, password);
  }
}
