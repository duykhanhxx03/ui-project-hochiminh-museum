import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/image_strings.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

class NewsModel {
  final String? id;
  //Include all information of a news{photo, title, description .etc}
  final List<dynamic> newsContent;

  NewsModel({
    required this.newsContent,
    this.id,
    required this.date,
  });

  final String defaultImageUrl =
      'https://firebasestorage.googleapis.com/v0/b/hochiminh-museum-uet-project.appspot.com/o/default.png?alt=media&token=8240041c-d492-40b7-b014-fe20b8e6297c';

  late String title = (newsContent.singleWhere(
    (element) => element['type'] == 'title',
    orElse: () => {
      'content': '',
    },
  ))['content']!;
  // late String thumbnailUrl = (newsContent.singleWhere(
  //   (element) => element['type'] == 'image',
  //   orElse: () => {
  //     'image_url': defaultImageUrl,
  //   },
  // ))['image_url']!;
  late String thumbnailUrl = defaultImageUrl;

  late String description = (newsContent.singleWhere(
    (element) => element['type'] == 'description',
    orElse: () => {
      'content': '',
    },
  ))['content']!;
  String date;
  toJson() {
    return {
      'date': date,
      'news_content': newsContent,
    };
  }

  factory NewsModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    var data = document.data()!;
    return NewsModel(
      id: document.id,
      newsContent: data['news_content'],
      date: data['date'],
    );
  }
}
