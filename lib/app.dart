import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/global_settings/controllers/dark_light_mode_controller.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/text_strings.dart';
import 'package:ui_project_hochiminh_museum/utils/theme/theme.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class App extends StatelessWidget {
  App({super.key});

  final themeController = Get.put(DarkLightModeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        navigatorObservers: [FlutterSmartDialog.observer],
        title: TTexts.appName,
        themeMode: themeController.getCurrentTheme(),
        builder: FlutterSmartDialog.init(),
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        // initialBinding: GeneralBindings(),
        home: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: TColors.primary,
            ),
          ),
        ),
        // home: const MuseumThreeDimensionScreen(),
      ),
    );
  }
}
