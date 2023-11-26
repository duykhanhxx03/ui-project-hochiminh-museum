import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/image_strings.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/text_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/success_screen/success_screen.dart';
import 'package:ui_project_hochiminh_museum/repository/authentication_repository/authentication_repository.dart';

class MailVerificationController extends GetxController {
  late Timer _timer;
  @override
  void onInit() {
    super.onInit();
    sendVerification();
    setTimerForAutoRedirect();
  }

  Future<void> sendVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
    } catch (e) {
      Get.snackbar(
        'Có lỗi, thử lại?',
        'Quá trình xác thực diễn ra lỗi',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.redAccent,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
      );
    }
  }

  void setTimerForAutoRedirect() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user!.emailVerified) {
        _timer.cancel();
        Get.off(
          SuccessScreen(
            image: TImages.staticSuccessIllustration,
            title: TTexts.yourAccountCreatedTitle,
            subtitle: TTexts.yourAccountCreatedSubTitle,
            callback: () {
              AuthenticationRepository.instance.setInitialScreen(user);
            },
          ),
        );
      }
    });
  }

  void manuallyCheckEmailVerification() {
    FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if (user!.emailVerified) {
      _timer.cancel();
      Get.off(
        SuccessScreen(
          image: TImages.staticSuccessIllustration,
          title: TTexts.yourAccountCreatedTitle,
          subtitle: TTexts.yourAccountCreatedSubTitle,
          callback: () {
            AuthenticationRepository.instance.setInitialScreen(user);
          },
        ),
      );
    } else {
      Get.snackbar(
        'Tài khoản chưa được xác nhận',
        'Kiểm tra email của bạn và thử lại',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.redAccent,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
      );
    }
  }
}
