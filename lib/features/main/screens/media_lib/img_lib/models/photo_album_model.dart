import 'package:cloud_firestore/cloud_firestore.dart';

class PhotoAlbumModel {
  final String? id;
  final String title;
  final String description;
  final List<dynamic> photos;
  final String date;

  PhotoAlbumModel({
    required this.date,
    required this.photos,
    required this.title,
    required this.description,
    this.id,
  });

  toJson() {
    return {
      'title': title,
      'description': description,
      'photos': photos,
      'date': date
    };
  }

  factory PhotoAlbumModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    var data = document.data()!;
    return PhotoAlbumModel(
      id: document.id,
      title: data['title'],
      description: data['description'],
      photos: data['photos'],
      date: data['date'],
    );
  }
}
