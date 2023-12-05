// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/controllers/comment_info_controller.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/models/comment_info_model.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/widgets/comment.dart';
import 'package:ui_project_hochiminh_museum/repository/authentication_repository/authentication_repository.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';

class ReviewScreen extends StatefulWidget {
  ReviewScreen({super.key, required this.commentList, required this.deThi});

  late List<CommentInfoModel> commentList;
  late String deThi;

  @override
  _ReviewScreen createState() => _ReviewScreen();
}

class _ReviewScreen extends State<ReviewScreen> {
  final controller = Get.put(CommentInfoController());
  // final controllerUser = Get.put(UserRepository());
  final _authRepo = Get.put(AuthenticationRepository());
  late List<CommentInfoModel> commentList;
  //late List<UserModel> userList;
  late String deThi;

  @override
  void initState() {
    commentList = widget.commentList;
    deThi = widget.deThi;
    super.initState();
  }

  TextEditingController commentController = TextEditingController();

  void addComment() async {
    String myComment = commentController.text;
    String? userIdEmail = _authRepo.firebaseUser.value?.email;
    if (myComment.isNotEmpty) {
      CommentInfoModel newComment = CommentInfoModel(
        //userId: userIdEmail as String,
        id: "${commentList.length + 1}",
        userId: userIdEmail as String,
        content: myComment,
        userLiked: [],
        date: Timestamp.fromDate(DateTime.now()),
      );
      controller.createComment(newComment, deThi);

      final List<CommentInfoModel> commentListResult =
          await controller.getAllComment(deThi);

      setState(() {
        commentList = commentListResult;
      });

      //commentList.add(newComment);
      commentController.clear();
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text(
          'Thảo luận',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        showBackArrow: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // ignore: invalid_use_of_protected_member
          (context as Element).reassemble();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: commentList.length,
                  itemBuilder: (context, index) {
                    return Comment(
                        commentInfo: commentList[index], deThi: deThi);
                  },
                ),
              ),
              // const Divider(
              //   thickness: 1,
              //   color: Color.fromARGB(255, 167, 165, 165),
              // ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: commentController,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: TColors.darkerGrey,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: TColors.darkerGrey,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                          ),
                          hintText: 'Nhập bình luận của bạn',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: addComment,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
