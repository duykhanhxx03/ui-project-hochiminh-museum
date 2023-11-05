// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:ui_project_hochiminh_museum/data/comment_data.dart';
import 'package:ui_project_hochiminh_museum/common/models/comment_info.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/widgets/comment.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});
  @override
  _ReviewScreen createState() => _ReviewScreen();
}

class _ReviewScreen extends State<ReviewScreen> {
  TextEditingController commentController = TextEditingController();

  void addComment() {
    String myComment = commentController.text;
    if (myComment.isNotEmpty) {
      setState(() {
        CommentInfo newComment = CommentInfo(
          userId: '2',
          content: myComment,
          userLiked: [],
          date: DateTime.now(),
        );
        commentList.add(newComment);
        commentController.clear();
        FocusScope.of(context).unfocus();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 173, 7, 7),
            leading: const BackButton(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            title: const Text(
              'Comments',
              style: TextStyle(
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
                  return Comment(commentInfo: commentList[index]);
                },
              ),
            ),
            const Divider(
              thickness: 1,
              color: Color.fromARGB(255, 167, 165, 165),
            ),
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
