import 'package:ui_project_hochiminh_museum/common/models/image_withdes_model.dart';

class News {
  final String title;
  final String time;
  final String date;
  final int views;
  final String content;
  final int group;
  final String recap;
  final List<ImageWithDescription> listImage;

  const News(
      {required this.title,
      required this.time,
      required this.date,
      required this.views,
      required this.content,
      required this.group,
      required this.recap,
      required this.listImage});
}
