import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';

class NetworkConnectivityController extends GetxController {
  static NetworkConnectivityController get instance => Get.find();
  late StreamSubscription streamSubscription;
  @override
  void onInit() {
    super.onInit();
    streamSubscription =
        Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
          messageText: const Text(
            'Vui lòng kiểm tra lại kết nối',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          isDismissible: false,
          duration: const Duration(days: 1),
          backgroundColor: TColors.error,
          icon: const Icon(
            Iconsax.global_refresh,
            color: Colors.white,
            size: 25,
          ),
          margin: const EdgeInsets.only(bottom: 80), //80 is BottomNavbar
          snackStyle: SnackStyle.GROUNDED);
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
