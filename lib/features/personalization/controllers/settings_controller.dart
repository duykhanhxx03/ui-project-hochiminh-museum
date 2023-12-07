import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ui_project_hochiminh_museum/global_settings/controllers/dark_light_mode_controller.dart';
import 'package:ui_project_hochiminh_museum/repository/authentication_repository/authentication_repository.dart';
import 'package:ui_project_hochiminh_museum/repository/authentication_repository/user_repository.dart';

class SettingsController extends GetxController {
  static SettingsController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());
  final _darkLight = Get.put(DarkLightModeController());
  final box = GetStorage("app-notifications");

  bool isOnNotification = false;
  @override
  void onInit() {
    super.onInit();
    box.writeIfNull('isOffNotification', false);
    isOnNotification = box.read('isOffNotification');
  }

  void toggleNotification(bool value) {
    box.writeIfNull('isOffNotification', false);
    isOnNotification = box.read('isOffNotification');
    isOnNotification = value;
    box.write('isOffNotification', isOnNotification);
  }

  getUserData() async {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return await _userRepo.getUserDetails(email);
    } else {
      Get.snackbar('Lỗi', 'Bạn phải đăng nhập để tiếp tục');
    }
  }

  setCurrentTheme(ThemeMode mode) {
    _darkLight.setCurrentTheme(mode);
  }

  ThemeMode getCurrentTheme() {
    return _darkLight.getCurrentTheme();
  }
}
