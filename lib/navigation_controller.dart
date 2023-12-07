import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/home/home.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/indoor_map/indoor_map.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/quiz_home.dart';
import 'package:ui_project_hochiminh_museum/features/personalization/screens/settings/settings.dart';

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();
  Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const IndoorMapScreen(),
    const QuizHome(),
    const SettingsScreen(),
  ];
}
