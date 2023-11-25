import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ui_project_hochiminh_museum/global_settings/controllers/dark_light_mode_controller.dart';
import 'package:ui_project_hochiminh_museum/repository/authentication_repository/authentication_repository.dart';
import 'package:ui_project_hochiminh_museum/repository/authentication_repository/user_repository.dart';

class SettingsController extends GetxController {
  static SettingsController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());
  // ignore: non_constant_identifier_names
  final _dark_light = Get.put(DarkLightModeController());

  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar('Lỗi', 'Bạn phải đăng nhập để tiếp tục');
    }
  }

  setCurrentTheme(ThemeMode mode) {
    _dark_light.setCurrentTheme(mode);
  }

  ThemeMode getCurrentTheme() {
    return _dark_light.getCurrentTheme();
  }
}
