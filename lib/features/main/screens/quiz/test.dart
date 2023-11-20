import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/review.dart';

import 'models/test_exam_question.dart';

class TestExamScreen extends StatefulWidget {
  const TestExamScreen({super.key, required this.questions});

  final List<TestExamQuestion> questions;

  @override
  State<TestExamScreen> createState() => _TestExamScreenState();
}

class _TestExamScreenState extends State<TestExamScreen> {
  // List<TestExamQuestion> questions = TestExamData.questions_list;
  // List<int> selectedAnswers = List.generate(questions.length, (index) => -1);
  late List<TestExamQuestion> questions;
  late List<int> selectedAnswers;
  late List<bool> checkIfTheAnswerIsTrueOfFalse;
  late Timer timer;
  int totalTimeInSeconds = 30;
  bool isSubmit = false;
  int score = 0;

  @override
  void initState() {
    super.initState();
    questions = widget.questions;
    selectedAnswers = List.generate(questions.length, (index) => -1);
    checkIfTheAnswerIsTrueOfFalse = List.generate(questions.length, (index) => false);

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
    if(!isSubmit) {
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
    int hours = totalTimeInSeconds ~/ 3600;
    int minutes = (totalTimeInSeconds % 3600) ~/ 60;
    int seconds = totalTimeInSeconds % 60;
    String formattedTime =
        '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Đề Thi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
        actions: [
          if(!isSubmit)
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ElevatedButton(
              onPressed: checkSubmit,
              child: const Text(
                '    Nộp bài   ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
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
            Container(
              // Display the timer in the top-right corner
              alignment: Alignment.topRight,
              child: Text(
                // 'Time: ${Duration(seconds: totalTimeInSeconds).toString()}',
                'Time: $formattedTime',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
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
                    if(!isSubmit)
                      Column(
                        children: List.generate(
                          questions[index].options.length,
                          (optionIndex) {
                            return RadioListTile(
                              title: Text(questions[index].options[optionIndex]),
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
                              title: Text(
                                questions[index].options[optionIndex],
                                style: TextStyle(
                                  color: (optionIndex == selectedAnswers[index] && checkIfTheAnswerIsTrueOfFalse[index])
                                      ? Colors.green
                                      : (optionIndex == selectedAnswers[index] && !checkIfTheAnswerIsTrueOfFalse[index])
                                      ? Colors.red
                                      : (optionIndex == questions[index].correctAnswerIndex)
                                      ? Colors.green
                                      : Colors.grey,
                                )
                              ),
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
<<<<<<< HEAD
            if(isSubmit)
            Container(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  ' Xem bình luận ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
=======
            if (isSubmit)
              Container(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(const ReviewScreen());
                  },
                  child: const Text(
                    ' Xem bình luận ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
>>>>>>> 7e5a152 (add opensans font, change the newlist and connect some screens with each other)
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
