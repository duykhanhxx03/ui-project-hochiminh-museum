import 'package:intl/intl.dart';

class CommentInfo {
  CommentInfo(
      {required this.userId,
      required this.content,
      required this.date,
      required this.userLiked});
  String userId;
  // String commentId;
  String content;
  var userLiked = [];
  final formatter = DateFormat.yMd();
  final DateTime date;

  bool isContain(String userId) {
    return userLiked.contains(userId);
  }

  void toggleLike(String userId) {
    if (isContain(userId)) {
      userLiked.remove(userId);
    } else {
      userLiked.add(userId);
    }
  }

  // ignore: non_constant_identifier_names
  String get FormattedDate {
    return formatter.format(date);
  }
}
