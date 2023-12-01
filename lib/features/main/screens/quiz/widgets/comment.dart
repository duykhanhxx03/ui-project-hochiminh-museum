// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/data/comment_data.dart';
import 'package:ui_project_hochiminh_museum/data/user_data.dart';
import 'package:ui_project_hochiminh_museum/common/models/user_info.dart';
import 'package:ui_project_hochiminh_museum/features/authentication/models/user_model.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/controllers/reply_comment_controller.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/models/comment_info_model.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/models/reply_comment_model.dart';
import 'package:ui_project_hochiminh_museum/repository/authentication_repository/authentication_repository.dart';
import 'package:ui_project_hochiminh_museum/repository/authentication_repository/user_repository.dart';

class Comment extends StatefulWidget {
  Comment({
    super.key,
    required this.commentInfo,
    required this.deThi,
  });

  final String deThi;
  CommentInfoModel commentInfo;

  @override
  State<Comment> createState() => _CommentState();
}

// class ReplyComment {
//   final String id;
//   final String content;
//   final String parentId;
//
//   ReplyComment({
//     required this.id,
//     required this.content,
//     required this.parentId,
//   });
// }

class _CommentState extends State<Comment> {
  late String deThi;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    deThi = widget.deThi;
  }

  final _authRepo = Get.put(AuthenticationRepository());
  final controllerUser = Get.put(UserRepository());
  final controller = Get.put(ReplyCommentController());

  List<ReplyCommentModel> replyCommentList = [];
  TextEditingController replyController = TextEditingController();
  String? parentId;

  void replyComment(String parentId, String content) async {
    String? userIdEmail = _authRepo.firebaseUser.value?.email;
    ReplyCommentModel newComment = ReplyCommentModel(
      id: userIdEmail as String,
      content: content,
      parentId: parentId,
      date: Timestamp.fromDate(DateTime.now()),
    );
    controller.createReplyComment(newComment, deThi);

    final List<ReplyCommentModel> replyCommentListResult = await controller.getAllReplyComment(deThi);

    setState(() {
      // replyCommentList.add(newComment);
      replyCommentList = replyCommentListResult;

      // parentId = null;
      replyController.clear();
    });
  }

  List<ReplyCommentModel> getReplyComments(String parentId) {
    return replyCommentList
        .where((comment) => comment.parentId == parentId)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    String? userIdEmail = _authRepo.firebaseUser.value?.email;
    /// HERE TO CHANGE
    final isLiked = widget.commentInfo.isContain(userIdEmail as String);

    // UserInfo? user = userList.firstWhere(
    //       (e) => e.id.toString() == widget.commentInfo.userId,
    // );

    // UserModel user = controllerUser.getUserDetails(widget.commentInfo.userId);

    // UserModel? user = controllerUser.getAllUsers().firstWhere(
    //   (e) => e.id.toString() == widget.commentInfo.userId,
    // );
    //print("aaa   " + widget.commentInfo.userId);
    return ListTile(
      leading: const CircleAvatar(
        //Avatar
        backgroundColor: Colors.blueGrey,
      ),
      title: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FutureBuilder(
              future: controllerUser.getUserDetails(widget.commentInfo.userId),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.done) {
                  if(snapshot.hasData) {
                    UserModel user = snapshot.data!;
                    return Text(
                      // ignore: unnecessary_string_interpolations
                      '${user.lastName} ${user.firstName}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    );
                  } else if(snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                }
                return const CircularProgressIndicator();
              },
            ),

            //Thời gian cmt
            Text(
              widget.commentInfo.FormattedDate,
              style: const TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
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
          Row(
            children: [
              IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_outline,
                    color: isLiked ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      ///HERE TO CHANGE

                      //widget.commentInfo.toggleLike(widget.commentInfo.userId);
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
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 380,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: TextField(
                                  autofocus: true,
                                  controller: replyController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Type your comment...',
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.send),
                                onPressed: () {
                                  replyComment(widget.commentInfo.userId,
                                      replyController.text);
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
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
                title: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        // ignore: unnecessary_string_interpolations
                        //'${user.fullName}',
                        'Nguyễn Nhật Lê', // Để tạm ntn  :)))
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      //Thời gian cmt
                      Text(
                        widget.commentInfo.FormattedDate,
                      ),
                    ],
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
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(
                              isLiked ? Icons.favorite : Icons.favorite_outline,
                              color: isLiked ? Colors.red : Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                widget.commentInfo.toggleLike(userIdEmail);
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
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 380,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: TextField(
                                            autofocus: true,
                                            controller: replyController,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Type your comment...',
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.send),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ),
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
            endIndent: 10,
            color: Color.fromARGB(255, 167, 165, 165),
          ),
        ],
      ),
    );
  }
}
