import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/video_lib/vid_lib_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: VideoLibScreen(),
    );
  }
}
