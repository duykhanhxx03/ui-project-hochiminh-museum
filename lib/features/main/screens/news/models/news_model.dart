import 'package:cloud_firestore/cloud_firestore.dart';

class NewsModel {
  final String? id;
  //Include all information of a news{photo, title, description .etc}
  final List<dynamic> newsContent;

  NewsModel({
    required this.newsContent,
    this.id,
    required this.date,
  });

  late String title = (newsContent
      .singleWhere((element) => element['type'] == 'title'))['content']!;
  late String thumbnailUrl = (newsContent
      .singleWhere((element) => element['type'] == 'image'))['image_url']!;
  late String description = (newsContent
      .singleWhere((element) => element['type'] == 'description'))['content']!;
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
