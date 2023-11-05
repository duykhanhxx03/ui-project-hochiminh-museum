import 'package:ui_project_hochiminh_museum/common/models/comment_info.dart';

List<CommentInfo> commentList = [
  CommentInfo(
    userId: '1',
    content: "hehehehehheheheeee",
    userLiked: ['1', '4'],
    date: DateTime(2023, 1, 2),
  ),
  CommentInfo(
    userId: '2',
    content: "hohohohhohhoho ",
    userLiked: ['1', '3', '2'],
    date: DateTime(2023, 3, 4),
  ),
  CommentInfo(
    userId: '3',
    content: "hihihihihihi",
    userLiked: ['1'],
    date: DateTime(2023, 5, 6),
  ),
  CommentInfo(
    userId: '4',
    content: "kekekekekkekekekee",
    userLiked: [],
    date: DateTime(2023, 7, 8),
  ),
];
