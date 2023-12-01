import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class CommentInfoModel {
  final String userId;
  final String content;
  final List<dynamic> userLiked;
  // final DateTime date;
  final Timestamp date;

  CommentInfoModel({
    required this.userId,
    required this.content,
    required this.userLiked,
    required this.date,
  });

  toJson() {
    return {
      'userId': userId,
      'content': content,
      'userLiked': userLiked,
      'date': date,
    };
  }

  bool isContain(String userId) {
    return userLiked.contains(userId);
  }

  String get FormattedDate {
    return DateFormat.yMd().format(date.toDate());
  }

  void toggleLike(String userId) {
    if (isContain(userId)) {
      userLiked.remove(userId);
    } else {
      userLiked.add(userId);
    }
  }

  factory CommentInfoModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return CommentInfoModel(
      userId: data['userId'],
      content: data['content'],
      userLiked: data['userLiked'],
      date: data['date'],
    );
  }
}