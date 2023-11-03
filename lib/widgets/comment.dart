// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/data/user_data.dart';
import 'package:ui_project_hochiminh_museum/models/comment_info.dart';
import 'package:ui_project_hochiminh_museum/models/user_info.dart';

class Comment extends StatefulWidget {
  Comment({
    super.key,
    required this.commentInfo,
  });
  CommentInfo commentInfo;

  @override
  State<Comment> createState() => _CommentState();
}

class ReplyComment {
  final String id;
  final String content;
  final String parentId;

  ReplyComment({
    required this.id,
    required this.content,
    required this.parentId,
  });
}

class _CommentState extends State<Comment> {
  List<ReplyComment> replyCommentList = [];
  TextEditingController replyController = TextEditingController();
  String? parentId;

  void replyComment(String parentId, String content) {
    ReplyComment newComment = ReplyComment(
      id: 3.toString(),
      content: content,
      parentId: parentId,
    );
    setState(() {
      replyCommentList.add(newComment);
      // parentId = null;
      replyController.clear();
    });
  }

  List<ReplyComment> getReplyComments(String parentId) {
    return replyCommentList
        .where((comment) => comment.parentId == parentId)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final isLiked = widget.commentInfo.isContain('3');
    UserInfo? user = userList.firstWhere(
      (e) => e.id.toString() == widget.commentInfo.userId,
    );
    return ListTile(
      leading: const CircleAvatar(
        //Avatar
        backgroundColor: Colors.blueGrey,
      ),
      title: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          // ignore: unnecessary_string_interpolations
          '${user.fullName}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              widget.commentInfo.content,
              style: const TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          Text(widget.commentInfo.FormattedDate),
          Row(
            children: [
              IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_outline,
                    color: isLiked ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.commentInfo.toggleLike('3');
                    });
                  }),
              Text(widget.commentInfo.userLiked.length
                  .toString()), // Số lượt thả tim cmt
              TextButton(
                style: TextButton.styleFrom(
                  alignment: Alignment.bottomRight,
                  textStyle: const TextStyle(fontSize: 14),
                ),
                onPressed: () {
                  // Mở hộp thoại để trả lời bình luận
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Reply'),
                        content: TextField(
                          controller: replyController,
                          decoration: const InputDecoration(
                            hintText: 'Type your comment',
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              replyComment(widget.commentInfo.userId,
                                  replyController.text);
                              Navigator.pop(context);
                            },
                            child: const Text('Send'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Reply'),
              ),
            ],
          ),
          Column(
            children:
                getReplyComments(widget.commentInfo.userId).map((replyComment) {
              return ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                ),
                title: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    // ignore: unnecessary_string_interpolations
                    //'${user.fullName}',
                    'Nguyễn Nhật Lê', // Để tạm ntn  :)))
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        replyComment.content,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                    Text(widget.commentInfo.FormattedDate),
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(
                              isLiked ? Icons.favorite : Icons.favorite_outline,
                              color: isLiked ? Colors.red : Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                widget.commentInfo.toggleLike('3');
                              });
                            }),
                        Text(widget.commentInfo.userLiked.length
                            .toString()), // Số lượt thả tim cmt
                        TextButton(
                          style: TextButton.styleFrom(
                            alignment: Alignment.bottomRight,
                            textStyle: const TextStyle(fontSize: 14),
                          ),
                          onPressed: () {
                            // Mở hộp thoại để trả lời bình luận
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Reply'),
                                  content: TextField(
                                    controller: replyController,
                                    decoration: const InputDecoration(
                                      hintText: 'Type your comment ',
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text('Send'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text('Reply'),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const Divider(
            thickness: 1,
            indent: 0,
            endIndent: 20,
            color: Color.fromARGB(255, 167, 165, 165),
          ),
        ],
      ),
    );
  }
}
