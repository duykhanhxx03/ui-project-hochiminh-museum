import 'package:ui_project_hochiminh_museum/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';
import 'package:ui_project_hochiminh_museum/utils/device/device_utility.dart';
import 'package:ui_project_hochiminh_museum/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunctions.isDarkMode(context);
    final controller = OnBoardingController.instance;

    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: isDark ? TColors.primary : Colors.black,
        ),
        onPressed: controller.nextPage,
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
