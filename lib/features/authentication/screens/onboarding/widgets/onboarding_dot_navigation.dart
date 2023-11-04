import 'package:ui_project_hochiminh_museum/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';
import 'package:ui_project_hochiminh_museum/utils/device/device_utility.dart';
import 'package:ui_project_hochiminh_museum/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunctions.isDarkMode(context);
    final controller = OnBoardingController.instance;

    return Positioned(
      left: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: isDark ? TColors.light : TColors.dark,
          dotHeight: 8,
        ),
      ),
    );
  }
}
