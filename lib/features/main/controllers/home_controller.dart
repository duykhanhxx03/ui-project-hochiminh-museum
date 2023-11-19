import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  final carouseCurrentlIndex = 0.obs;

  void updatePageIndicator(index) {
    carouseCurrentlIndex.value = index;
  }
}
