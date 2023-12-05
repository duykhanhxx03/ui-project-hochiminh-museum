import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/utils/network_connectivity/network_connectivity_controller.dart';

class DependencyInjection {
  static void init() {
    Get.put<NetworkConnectivityController>(NetworkConnectivityController(),
        permanent: true);
  }
}
