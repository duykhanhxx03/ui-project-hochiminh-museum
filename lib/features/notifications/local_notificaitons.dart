import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:ui_project_hochiminh_museum/features/notifications/notifiactions_screen.dart';

class LocalNotification {
  static final FlutterLocalNotificationsPlugin _notiPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    await FirebaseMessaging.instance.requestPermission();
    await FirebaseMessaging.instance.getInitialMessage();
    final token = await FirebaseMessaging.instance.getToken();
    print("Token: ${token}");
    const InitializationSettings initialSettings = InitializationSettings(
        android: AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    ));
    _notiPlugin.initialize(initialSettings,
        onDidReceiveNotificationResponse: (NotificationResponse details) {
      Get.to(const NotificationScreen());
    });
  }

  static void showNotification(RemoteMessage message) {
    const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
            'com.example.testing_app', 'testing_app',
            importance: Importance.max, priority: Priority.high));

    _notiPlugin.show(
      DateTime.now().microsecond,
      message.notification!.title,
      message.notification!.body,
      notificationDetails,
      payload: message.data.toString(),
    );
  }
}
