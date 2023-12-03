import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/features/authentication/models/user_model.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/controllers/comment_info_controller.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/controllers/reply_comment_controller.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/models/comment_info_model.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/models/reply_comment_model.dart';
import 'package:ui_project_hochiminh_museum/repository/authentication_repository/authentication_repository.dart';
import 'package:ui_project_hochiminh_museum/repository/authentication_repository/user_repository.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';

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

class _CommentState extends State<Comment> {
  late String deThi;

  final _authRepo = Get.put(AuthenticationRepository());
  final controllerUser = Get.put(UserRepository());
  final controller = Get.put(ReplyCommentController());
  final controllerCommentInfo = Get.put(CommentInfoController());

  List<ReplyCommentModel> replyCommentList = [];
  TextEditingController replyController = TextEditingController();
  String? parentId;
  double endY = 0;

  @override
  void initState() {
    super.initState();
    deThi = widget.deThi;
    initAllReplyComments();
  }

  void replyComment(String parentId, String content) async {
    String? userIdEmail = _authRepo.firebaseUser.value?.email;
    ReplyCommentModel newComment = ReplyCommentModel(
      id: userIdEmail as String,
      content: content,
      parentId: parentId,
      date: Timestamp.fromDate(DateTime.now()),
    );
    controller.createReplyComment(newComment, deThi);

    final List<ReplyCommentModel> replyCommentListResult =
        await controller.getAllReplyComment(deThi);

    //print(replyCommentListResult);
    setState(() {
      // replyCommentList.add(newComment);
      replyCommentList = replyCommentListResult;

      // parentId = null;
      replyController.clear();
    });
  }

  void initAllReplyComments() async {
    final List<ReplyCommentModel> replyCommentListResult =
        await controller.getAllReplyComment(deThi);
    replyCommentList = replyCommentListResult;
  }

  List<ReplyCommentModel> getReplyComments(String id) {
    return replyCommentList.where((comment) => comment.parentId == id).toList();
  }

  @override
  Widget build(BuildContext context) {
    String? userIdEmail = _authRepo.firebaseUser.value?.email;
    final isLiked = widget.commentInfo.isContain(userIdEmail as String);

    return FutureBuilder(
        future: controllerUser.getUserDetails(widget.commentInfo.userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              UserModel user = snapshot.data!;
              //print(user.toJson());
              return buildCommentWidget(user, isLiked);
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
          }
          return const CircularProgressIndicator();
        });
  }

  Widget buildCommentWidget(UserModel user, bool isLiked) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar

          CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 124, 124, 124),
            radius: 22,
            backgroundImage: NetworkImage(user.avatar_imgURL),
          ),

          const SizedBox(width: 8),

          // Thông tin bình luận
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tên và thời gian
                Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 236, 232, 232),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${user.lastName} ${user.firstName}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                widget.commentInfo.formattedDate,
                                style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Nội dung bình luận
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
                    ],
                  ),
                ),
                // Like và reply
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_outline,
                        color: isLiked ? Colors.red : Colors.grey,
                      ),
                      onPressed: () async {
                        String? userIdEmail =
                            _authRepo.firebaseUser.value?.email;
                        widget.commentInfo.toggleLike(userIdEmail as String);
                        // CommentInfoModel commentInfoModel = CommentInfoModel(
                        //     id: id,
                        //     userId: userId,
                        //     content: content,
                        //     userLiked: userLiked,
                        //     date: date
                        // );
                        await controllerCommentInfo.updateCommentUserLiked(
                            deThi,
                            widget.commentInfo.id,
                            widget.commentInfo.userLiked);
                        setState(() {
                          ///HERE TO CHANGE
                          widget.commentInfo.userLiked =
                              widget.commentInfo.userLiked;
                        });
                      },
                    ),
                    Text(
                      widget.commentInfo.userLiked.length.toString(),
                      style: const TextStyle(fontSize: 16),
                    ), // Số lượt thả tim cmt
                    TextButton(
                      style: TextButton.styleFrom(
                        alignment: Alignment.centerRight,
                        textStyle: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 124, 123, 123),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        showReplyModal(user);
                      },
                      child: Text(
                        'Reply',
                        style: TextStyle(
                          color: TColors.primary.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: getReplyComments(widget.commentInfo.id).length,
                  itemBuilder: (BuildContext context, int index) {
                    ReplyCommentModel replyComment =
                        getReplyComments(widget.commentInfo.id)[index];
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(
                        16,
                        0,
                        0,
                        0,
                      ), // Thụt vào từ trái
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FutureBuilder(
                            future:
                                controllerUser.getUserDetails(replyComment.id),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                if (snapshot.hasData) {
                                  UserModel userReply = snapshot.data!;
                                  //print(user.toJson());
                                  return CircleAvatar(
                                    backgroundColor: Colors.blueGrey,
                                    radius: 18,
                                    backgroundImage:
                                        NetworkImage(userReply.avatar_imgURL),
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                }
                              }
                              return const CircularProgressIndicator();
                            },
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 236, 232, 232),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            FutureBuilder(
                                              future:
                                                  controllerUser.getUserDetails(
                                                      replyComment.id),
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.done) {
                                                  if (snapshot.hasData) {
                                                    UserModel userReply =
                                                        snapshot.data!;
                                                    //print(user.toJson());
                                                    return Text(
                                                      ///HERE TO CHANGE
                                                      "${userReply.lastName} ${userReply.firstName}",
                                                      // để tạm ntn, sau sẽ lấy id của user đang login
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                      ),
                                                    );
                                                  } else if (snapshot
                                                      .hasError) {
                                                    return Text(
                                                        'Error: ${snapshot.error}');
                                                  }
                                                }
                                                return const CircularProgressIndicator();
                                              },
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                replyComment.formattedDate,
                                                style: const TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          replyComment.content,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                // reply

                const Divider(
                  thickness: 1,
                  indent: 0,
                  endIndent: 10,
                  color: Color.fromARGB(255, 197, 197, 197),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showReplyModal(UserModel user) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: double.infinity,
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
                    replyComment(
                      widget.commentInfo.id,
                      replyController
                          .text, // Truyền nội dung nhập từ bàn phím vào hàm replyComment
                    );
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  double calculateEndY() {
    // Chiều cao của comment chính và các phản hồi
    double commentHeight =
        calculateCommentHeight(widget.commentInfo.id, onlyComment: true);

    // Kiểm tra xem có phản hồi hay không
    if (replyCommentList.isNotEmpty) {
      endY = commentHeight;
    }
    // print(totalHeight);
    return endY;
  }

  double calculateCommentHeight(String id, {bool onlyComment = false}) {
    double commentHeight = 50;
    double replyHeight = 89;
    int numberOfReplies = getReplyComments(id).length;

    // Tính toán vị trí dựa trên số lượng replies và kích thước của chúng
    double totalHeight = commentHeight;
    for (int i = 0; i < numberOfReplies; i++) {
      totalHeight += replyHeight;
    }

    return totalHeight;
  }
}
