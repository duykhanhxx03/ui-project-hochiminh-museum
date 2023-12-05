import 'package:cloud_firestore/cloud_firestore.dart';

class CommentInfoModel {
  final String id;
  final String userId;
  final String content;
  late List<dynamic> userLiked;
  // final DateTime date;
  final Timestamp date;

  CommentInfoModel({
    required this.id,
    required this.userId,
    required this.content,
    required this.userLiked,
    required this.date,
  });

  toJson() {
    return {
      'id': id,
      'userId': userId,
      'content': content,
      'userLiked': userLiked,
      'date': date,
    };
  }

  bool isContain(String userId) {
    return userLiked.contains(userId);
  }

  String get formattedDate {
    final diff = DateTime.now().difference(date.toDate());
    String result;
    if (diff.inMinutes < 60) {
      result = '${diff.inMinutes} phút';
    } else if (diff.inHours <= 24) {
      result = '${diff.inHours} giờ';
    } else if (diff.inDays < 7) {
      result = '${diff.inDays} ngày';
    } else if (diff.inDays < 365) {
      result = '${(diff.inDays / 7) as int} tuần';
    } else {
      result = '${(diff.inDays / 365) as int} năm';
    }
    return result;
  }

  void toggleLike(String userId) {
    if (isContain(userId)) {
      userLiked.remove(userId);
    } else {
      userLiked.add(userId);
    }
    // return isContain(userId);
  }

  factory CommentInfoModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return CommentInfoModel(
      id: data['id'],
      userId: data['userId'],
      content: data['content'],
      userLiked: data['userLiked'],
      date: data['date'],
    );
  }
}
