import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

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
    return DateFormat.yMd().format(date.toDate());
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
