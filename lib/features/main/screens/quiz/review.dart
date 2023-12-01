// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:ui_project_hochiminh_museum/data/comment_data.dart';
import 'package:ui_project_hochiminh_museum/common/models/comment_info.dart';
import 'package:ui_project_hochiminh_museum/features/authentication/models/user_model.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/controllers/comment_info_controller.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/models/comment_info_model.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/widgets/comment.dart';
import 'package:ui_project_hochiminh_museum/repository/authentication_repository/authentication_repository.dart';
import 'package:ui_project_hochiminh_museum/repository/authentication_repository/user_repository.dart';

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
    // TODO: implement initState
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

      final List<CommentInfoModel> commentListResult = await controller.getAllComment(deThi);

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
    return MaterialApp(
        home: KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 173, 7, 7),
            leading: BackButton(
              color: const Color.fromARGB(255, 255, 255, 255),
              onPressed: () {
                Get.back();
              },
            ),
            title: const Text(
              'Thảo luận',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true),
        body: Column(
          children: [
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: commentList.length,
                itemBuilder: (context, index) {
                  return Comment(commentInfo: commentList[index], deThi: deThi);
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
                        border: OutlineInputBorder(),
                        hintText: 'Type your comment...',
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
    ));
  }
}
