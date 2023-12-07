import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/state_manager.dart';
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

  // testing();
  print("OPEN APP ${GetStorage("app-notifications").read("notifications")}");
  FirebaseMessaging.onMessage.listen((message) {
    handlePushNotification(message);
  });

  // GetStorage("app-notifications").remove("notifications");

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
  List<NotificationsMessageModel> listNoti = [];
  var model = NotificationsMessageModel(title: title, body: body, data: data);
  if (box.read("notifications") != null) {
    var jsonArray = box.read("notifications");
    List dataList = jsonDecode(jsonArray);
    for (var data in dataList) {
      listNoti.add(NotificationsMessageModel().fromJson(data));
    }
    listNoti.insert(0, model);
    dataList = listNoti.map((e) => e.toJson()).toList();
    jsonArray = jsonEncode(dataList);
    box.write("notifications", jsonArray);
  } else {
    listNoti.insert(0, model);
    List dataList = listNoti.map((e) => e.toJson()).toList();
    var jsonArray = jsonEncode(dataList);
    box.write("notifications", jsonArray);
  }
  LocalNotification.showNotification(message);
}
