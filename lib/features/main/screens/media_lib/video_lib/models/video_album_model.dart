import 'package:cloud_firestore/cloud_firestore.dart';

class VideoAlbumModel {
  final String? id;
  final String title;
  final String youtubeUrl;
  final String date;

  VideoAlbumModel({
    required this.date,
    required this.youtubeUrl,
    required this.title,
    this.id,
  });

  toJson() {
    return {
      'title': title,
      'youtube-url': youtubeUrl,
      'date': date,
    };
  }

  factory VideoAlbumModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    var data = document.data()!;
    return VideoAlbumModel(
      id: document.id,
      title: data['title'],
      youtubeUrl: data['youtube-url'],
      date: data['date'],
    );
  }
}
