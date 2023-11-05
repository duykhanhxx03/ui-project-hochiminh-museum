import 'package:ui_project_hochiminh_museum/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';
import 'package:ui_project_hochiminh_museum/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: controller.skipPage,
        child: const Text('Skip'),
      ),
    );
  }
}
