import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ui_project_hochiminh_museum/features/notifications/notifiactions_model.dart';

class NotificationsController extends GetxController {
  static NotificationsController get instance => Get.find();
  List<NotificationsMessageModel> listNotification = [];

  void getListNotification() {
    final box = GetStorage("app-notifications");
    print("keke");
    print(box.read("notifications"));
  }
}
