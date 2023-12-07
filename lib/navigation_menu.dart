import 'package:ui_project_hochiminh_museum/features/main/screens/home/home.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/indoor_map/indoor_map.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/quiz_home.dart';
import 'package:ui_project_hochiminh_museum/features/personalization/screens/settings/settings.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'navigation_controller.dart';

class NavigationMenu extends StatelessWidget {
  NavigationMenu({super.key});

  NavigationController controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    print('keke');

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? TColors.black : TColors.white,
          indicatorColor: darkMode
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Trang chủ"),
            NavigationDestination(
                icon: Icon(Iconsax.route_square), label: "Khám phá"),
            NavigationDestination(
                icon: Icon(Iconsax.teacher), label: "Học tập"),
            NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}
