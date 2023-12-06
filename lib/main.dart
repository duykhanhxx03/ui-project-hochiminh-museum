import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:ui_project_hochiminh_museum/app.dart';
import 'package:ui_project_hochiminh_museum/dependency_injection.dart';
import 'package:ui_project_hochiminh_museum/features/notifications/local_notificaitons.dart';
import 'package:ui_project_hochiminh_museum/features/notifications/notifiactions_model.dart';
import 'package:ui_project_hochiminh_museum/firebase_options.dart';
import 'package:ui_project_hochiminh_museum/repository/authentication_repository/authentication_repository.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await LocalNotification.initialize();

  //saves app config
  await GetStorage.init('app-setting-configs');
  await GetStorage.init("app-notifications");
  // final controller = Get.put(NotificationsController()).listNotification;

  testing();

  FirebaseMessaging.onMessage.listen((message) {
    handlePushNotification(message);
  });

  final initList = {
    'TinTucSuKien': [
      'HDBaoTang',
      'HDHeThongCacBT_DTLuuNiemHCM',
      'HDNganhDSVH',
      'HDBaoTangTrenTG',
    ],
    'NghienCuu': [
      'NghienCuuHCM',
      'ChuyenKeHCM',
      'AnPhamHCM',
      'BoSuuTap',
      'HienVatKeChuyen',
      'HDKhoaHoc',
      'CongBoKH',
    ],
    'GiaoDuc': [
      'HocTapTheoTamGuongHCM',
      'KeChuyenHCM',
      'NhungTamGuong',
      'PhongKhamPha',
      'BoiDuongNghiepVu',
      'CacHoatDongKhac',
    ]
  };

  for (var i in initList.keys) {
    await GetStorage.init(i);
  }

  //cache news

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (value) => Get.put(
      AuthenticationRepository(),
    ),
  );
  runApp(const MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return App();
  }
}

void handlePushNotification(message) async {
  final box = GetStorage("app-notifications");

  String title = message.notification!.title as String;
  String body = message.notification!.body as String;
  dynamic data = message.data;

  List<NotificationsMessageModel> listNotifications = [];
  NotificationsMessageModel model = NotificationsMessageModel(
      title: title, body: body, data: data, timestamp: DateTime.now());

  listNotifications.insert(0, model);
  print("object enable encode ${jsonEncode(model)}");

  print("list enable encode ${jsonEncode(listNotifications)}");

  await box.write("notifications", jsonEncode(listNotifications));

  print("insert ${box.read("notifications")}");

  GetStorage("app-notifications").write("notifications", listNotifications);

  print(GetStorage("app-notifications").read("notifications"));

  // final controller = Get.put(NotificationsController());
  // controller.listNotification = listNotifications;
  LocalNotification.showNotification(message);
}

void testing() {
  List<NotificationsMessageModel> list = [
    NotificationsMessageModel(
        title: "title1", body: "body1", timestamp: DateTime.now()),
    NotificationsMessageModel(
        title: "title2", body: "body2", timestamp: DateTime.now()),
    NotificationsMessageModel(
        title: "title3", body: "body3", timestamp: DateTime.now())
  ];

  final box = GetStorage("app-notifications");

//save
  List notis = list.map((e) => e.toJson()).toList();
  box.write("notifications", notis);
  if (kDebugMode) {
    print("listString1 $notis");
  }

  List listString = box.read("notifications");

  print("listString2 $listString");

  List list2 = [];

  for (var noti in listString) {
    list2.add(NotificationsMessageModel().fromJson(noti));
  }
  list2.map((e) => print(e));

  //save
}
