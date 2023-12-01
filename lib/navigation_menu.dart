import 'package:ui_project_hochiminh_museum/features/main/screens/home/home.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/indoor_map/indoor_map.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/quiz_home.dart';
import 'package:ui_project_hochiminh_museum/features/personalization/screens/settings/settings.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key, this.initialIndex});

  final int? initialIndex;

  @override
  Widget build(BuildContext context) {
    late NavigationController controller = Get.put(NavigationController());

    if(initialIndex != null) {
      controller = Get.put(NavigationController(initialIndex: initialIndex));
    }

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

class NavigationController extends GetxController {
  late Rx<int> selectedIndex;

  NavigationController({int? initialIndex}) {
    if (initialIndex != null) {
      selectedIndex = initialIndex.obs;
    } else {
      selectedIndex = 0.obs;
    }
  }

  final screens = [
    const HomeScreen(),
    const IndoorMapScreen(),
    const QuizHome(),
    const SettingsScreen(),
  ];
}
