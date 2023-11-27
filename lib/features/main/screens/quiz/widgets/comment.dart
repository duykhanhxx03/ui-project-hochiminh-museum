import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/common/models/comment_info.dart';
import 'package:ui_project_hochiminh_museum/common/models/user_info.dart';
import 'package:ui_project_hochiminh_museum/data/user_data.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/widgets/comment_connector.dart';

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

// ignore: must_be_immutable
class Comment extends StatefulWidget {
  Comment({
    super.key,
    required this.commentInfo,
  });
  CommentInfo commentInfo;
  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  List<ReplyComment> replyCommentList = [];
  TextEditingController replyController = TextEditingController();
  String? parentId;
  double endY = 0;
  void replyComment(String parentId, String content) {
    ReplyComment newComment = ReplyComment(
      id: 2.toString(),
      content: content,
      parentId: parentId,
    );
    setState(
      () {
        replyCommentList.add(newComment);
        replyController.clear();
      },
    );
  }

  List<ReplyComment> getReplyComments(String parentId) {
    return replyCommentList
        .where((comment) => comment.parentId == parentId)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final isLiked = widget.commentInfo.isContain('2');
    final user = userList
        .firstWhere((e) => e.id.toString() == widget.commentInfo.userId);

    return buildCommentWidget(user, isLiked);
  }

  Widget buildCommentWidget(UserInfo user, bool isLiked) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          CustomPaint(
            painter: replyCommentList.isNotEmpty
                ? CommentConnector(
                    startX: 22,
                    startY: 50,
                    endX: 22,
                    endY: calculateEndY(),
                    curved: false,
                  )
                : null, // Trả về null khi không có phản hồi
            child: const CircleAvatar(
              backgroundColor: Colors.blueGrey,
              radius: 22,
            ),
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
                              user.fullName,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                widget.commentInfo.FormattedDate,
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
                      onPressed: () {
                        setState(() {
                          widget.commentInfo.toggleLike('2');
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
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        showReplyModal(user);
                      },
                      child: const Text('Reply'),
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: getReplyComments(widget.commentInfo.userId).length,
                  itemBuilder: (BuildContext context, int index) {
                    ReplyComment replyComment =
                        getReplyComments(widget.commentInfo.userId)[index];
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(
                          16, 0, 0, 0), // Thụt vào từ trái
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomPaint(
                            painter: CommentConnector(
                              startX: -46,
                              startY: 0,
                              endX: endY,
                              endY: 19,
                              curved: true,
                            ),
                            child: const CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              radius: 18,
                            ),
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
                                            const Text(
                                              'Nguyễn Nhật Lê', // để tạm ntn, sau sẽ lấy id của user đang login
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                widget
                                                    .commentInfo.FormattedDate,
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

                                // Row(
                                //   children: [
                                //     IconButton(
                                //       icon: Icon(
                                //         isLiked
                                //             ? Icons.favorite
                                //             : Icons.favorite_outline,
                                //         color:
                                //             isLiked ? Colors.red : Colors.grey,
                                //       ),
                                //       onPressed: () {
                                //         setState(() {
                                //           replyComment.toggleLike('2');
                                //         });
                                //       },
                                //     ),
                                //     Text(replyComment.userLiked.length
                                //         .toString()), // Số lượt thả tim cho reply
                                //   ],
                                // ),
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
                  thickness: 2,
                  indent: 0,
                  endIndent: 10,
                  color: Color.fromARGB(255, 167, 165, 165),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showReplyModal(UserInfo user) {
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
                      widget.commentInfo.userId,
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
        calculateCommentHeight(widget.commentInfo.userId, onlyComment: true);

    // Kiểm tra xem có phản hồi hay không
    if (replyCommentList.isNotEmpty) {
      endY = commentHeight;
    }
    // print(totalHeight);
    return endY;
  }

  double calculateCommentHeight(String parentId, {bool onlyComment = false}) {
    double commentHeight = 50;
    double replyHeight = 89;
    int numberOfReplies = getReplyComments(parentId).length;

    // Tính toán vị trí dựa trên số lượng replies và kích thước của chúng
    double totalHeight = commentHeight;
    for (int i = 0; i < numberOfReplies; i++) {
      totalHeight += replyHeight;
    }

    return totalHeight;
  }
}
