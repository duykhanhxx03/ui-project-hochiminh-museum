import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ui_project_hochiminh_museum/features/admin/screens/create_news/create_news.dart';
import 'package:ui_project_hochiminh_museum/features/admin/screens/create_news/text_editor_screen.dart';
import 'package:ui_project_hochiminh_museum/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/text_strings.dart';
import 'package:ui_project_hochiminh_museum/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      // initialBinding: GeneralBindings(),
      home: OnBoardingScreen(),
      // home: const MuseumThreeDimensionScreen(),
    );
  }
}
