import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DarkLightModeController extends GetxController {
  static DarkLightModeController get instance => Get.find();
  final _currentTheme = ThemeMode.system.obs;

  ThemeMode getCurrentTheme() {
    return _currentTheme.value;
  }

  void setCurrentTheme(ThemeMode mode) {
    _currentTheme.value = mode;
  }
}
