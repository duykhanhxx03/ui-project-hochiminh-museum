import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/data/comment_data.dart';
import 'package:ui_project_hochiminh_museum/features/main/models/test_exam_model.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/controllers/comment_info_controller.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/review.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';

class TestExamScreen extends StatefulWidget {
  const TestExamScreen(
      {super.key, required this.questions, required this.title});

  final List<TestExamModel> questions;
  final String title;

  @override
  State<TestExamScreen> createState() => _TestExamScreenState();
}

class _TestExamScreenState extends State<TestExamScreen> {
  // List<TestExamQuestion> questions = TestExamData.questions_list;
  // List<int> selectedAnswers = List.generate(questions.length, (index) => -1);
  late String title;
  late List<TestExamModel> questions;
  late List<int> selectedAnswers;
  late List<bool> checkIfTheAnswerIsTrueOfFalse;
  late Timer timer;
  int totalTimeInSeconds = 30;
  bool isSubmit = false;
  int score = 0;
  late String deThi;

  @override
  void initState() {
    super.initState();
    questions = widget.questions;
    title = widget.title;
    deThi = title == 'Đề thi 1' ? "DeThi1" : "DeThi2";
    // print(deThi);
    selectedAnswers = List.generate(questions.length, (index) => -1);
    checkIfTheAnswerIsTrueOfFalse =
        List.generate(questions.length, (index) => false);

    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (totalTimeInSeconds > 0) {
        setState(() {
          totalTimeInSeconds--;
        });
      } else {
        // Auto-submit the quiz when the time is up
        submitQuiz();
      }
    });
  }

  void checkSubmit() {
    if (!isSubmit) {
      if (selectedAnswers.contains(-1)) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Lỗi'),
              content: const Text(
                  'Vui lòng trả lời hết các câu hỏi trước khi nộp bài.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Đóng'),
                ),
              ],
            );
          },
        );
      } else {
        submitQuiz();
      }
    }
  }

  void submitQuiz() {
    timer.cancel();
    score = 0;

    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i].correctAnswerIndex) {
        checkIfTheAnswerIsTrueOfFalse[i] = true;
        score++;
      }
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Kết quả'),
          content: Text('Điểm của bạn: $score/${questions.length}'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  isSubmit = true;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Đóng'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CommentInfoController());
    int hours = totalTimeInSeconds ~/ 3600;
    int minutes = (totalTimeInSeconds % 3600) ~/ 60;
    int seconds = totalTimeInSeconds % 60;
    String formattedTime =
        '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

    return Scaffold(
      appBar: TAppBar(
        isForceWhiteBackArrow: true,
        showBackArrow: true,
        backgroundColor: TColors.primary,
        title: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 14),
            const SizedBox(width: 14),
            Text(
              // 'Time: ${Duration(seconds: totalTimeInSeconds).toString()}',
              'Time: $formattedTime',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: [
          if (!isSubmit)
            Padding(
              padding: const EdgeInsets.only(right: 16, bottom: 4),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 133, 0, 29),
                ),
                onPressed: checkSubmit,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Nộp bài',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(right: 22),
              child: Text(
                'Điểm: $score/${questions.length}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          alignment: AlignmentDirectional.topStart,
          children: [
            // Container(
            //   // Display the timer in the top-right corner
            //   alignment: Alignment.topRight,
            //   child: Text(
            //     // 'Time: ${Duration(seconds: totalTimeInSeconds).toString()}',
            //     'Time: $formattedTime',
            //     style: const TextStyle(
            //       color: Colors.black,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Câu ${index + 1}: ${questions[index].question}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    if (!isSubmit)
                      Column(
                        children: List.generate(
                          questions[index].options.length,
                          (optionIndex) {
                            return RadioListTile(
                              title:
                                  Text(questions[index].options[optionIndex]),
                              value: optionIndex,
                              groupValue: selectedAnswers[index],
                              onChanged: (value) {
                                setState(() {
                                  selectedAnswers[index] = value!;
                                });
                              },
                            );
                          },
                        ),
                      )
                    else
                      Column(
                        children: List.generate(
                          questions[index].options.length,
                          (optionIndex) {
                            return RadioListTile(
                              title: Text(questions[index].options[optionIndex],
                                  style: TextStyle(
                                    color: (optionIndex ==
                                                selectedAnswers[index] &&
                                            checkIfTheAnswerIsTrueOfFalse[
                                                index])
                                        ? Colors.green
                                        : (optionIndex ==
                                                    selectedAnswers[index] &&
                                                !checkIfTheAnswerIsTrueOfFalse[
                                                    index])
                                            ? Colors.red
                                            : (optionIndex ==
                                                    questions[index]
                                                        .correctAnswerIndex)
                                                ? Colors.green
                                                : Colors.grey,
                                  )),
                              value: optionIndex,
                              groupValue: selectedAnswers[index],
                              onChanged: null,
                            );
                          },
                        ),
                      )
                  ],
                );
              },
            ),
            if (isSubmit)
              Container(
                alignment: Alignment.bottomRight,
                child: FutureBuilder(
                    future: controller.getAllComment(deThi),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          CommentListData.commentList1 = snapshot.data!;
                          return ElevatedButton(
                            onPressed: () {
                              Get.to(() => ReviewScreen(
                                  commentList: CommentListData.commentList1,
                                  deThi: deThi));
                            },
                            child: const Text(
                              ' Xem bình luận ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                      }
                      return const CircularProgressIndicator();
                    }),
              ),
          ],
        ),
      ),
    );
  }
}
