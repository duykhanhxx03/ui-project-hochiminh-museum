import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ui_project_hochiminh_museum/global_settings/controllers/dark_light_mode_controller.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/text_strings.dart';
import 'package:ui_project_hochiminh_museum/utils/theme/theme.dart';

class App extends StatelessWidget {
  App({super.key});

  final themeController = Get.put(DarkLightModeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        title: TTexts.appName,
        themeMode: themeController.getCurrentTheme(),
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        // initialBinding: GeneralBindings(),
        home: const OnBoardingScreen(),
        // home: const MuseumThreeDimensionScreen(),
      ),
    );
  }
}
