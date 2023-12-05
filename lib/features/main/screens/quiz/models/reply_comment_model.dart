import 'package:cloud_firestore/cloud_firestore.dart';

class ReplyCommentModel {
  final String id;
  final String content;
  final String parentId;
  final Timestamp date;

  ReplyCommentModel({
    required this.id,
    required this.content,
    required this.parentId,
    required this.date,
  });

  toJson() {
    return {
      'id': id,
      'content': content,
      'parentId': parentId,
      'date': date,
    };
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

  factory ReplyCommentModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ReplyCommentModel(
      id: data['id'],
      content: data['content'],
      parentId: data['parentId'],
      date: data['date'],
    );
  }
}
