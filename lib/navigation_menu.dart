import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'navigation_controller.dart';

// ignore: must_be_immutable
class NavigationMenu extends StatelessWidget {
  NavigationMenu({super.key});

  NavigationController controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

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
            NavigationDestination(
              icon: Icon(Iconsax.home),
              label: "Trang chủ",
              selectedIcon: Icon(
                Iconsax.home,
                color: TColors.primary,
              ),
            ),
            NavigationDestination(
              icon: Icon(Iconsax.route_square),
              label: "Khám phá",
              selectedIcon: Icon(
                Iconsax.route_square,
                color: TColors.primary,
              ),
            ),
            NavigationDestination(
              icon: Icon(Iconsax.teacher),
              label: "Học tập",
              selectedIcon: Icon(
                Iconsax.teacher,
                color: TColors.primary,
              ),
            ),
            NavigationDestination(
              icon: Icon(Iconsax.user),
              label: "Profile",
              selectedIcon: Icon(
                Iconsax.user,
                color: TColors.primary,
              ),
            ),
          ],
        ),
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: [...controller.screens],
        ),
      ),
    );
  }
}
