import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:ui_project_hochiminh_museum/app.dart';
import 'package:ui_project_hochiminh_museum/features/notifications/local_notificaitons.dart';
import 'package:ui_project_hochiminh_museum/features/notifications/notifiactions_model.dart';
import 'package:ui_project_hochiminh_museum/firebase_options.dart';
import 'package:ui_project_hochiminh_museum/repository/authentication_repository/authentication_repository.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  //saves app config
  await GetStorage.init('app-setting-configs');
  await GetStorage.init('app-notifications');
  LocalNotification.initialize();
  FirebaseMessaging.onMessage.listen((message) {
    String title = message.notification!.title as String;
    String body = message.notification!.body as String;
    dynamic data = message.data;
    List<NotificationsMessageModel> listNotifications = [];
    listNotifications
        .add(NotificationsMessageModel(title: title, body: body, data: data));
    GetStorage().write('app-notifications', listNotifications);
    print("day la title: ${listNotifications[0].title}");
    LocalNotification.showNotification(message);
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
  // box.writeInMemory(document, {
  //   'last-modified': DateTime.now(),
  //   'data': newsData,
  // });

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
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App(),
    );
  }
}
