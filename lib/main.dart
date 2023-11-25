import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:ui_project_hochiminh_museum/app.dart';
import 'package:ui_project_hochiminh_museum/firebase_options.dart';
import 'package:ui_project_hochiminh_museum/repository/authentication_repository/authentication_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
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
