import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/data/test_exam_data.dart';

class TestExamScreen extends StatefulWidget {
  const TestExamScreen({super.key});

  @override
  State<TestExamScreen> createState() => _TestExamScreenState();
}

class _TestExamScreenState extends State<TestExamScreen> {
  // List<TestExamQuestion> questions = TestExamData.questions_list;
  // List<int> selectedAnswers = List.generate(questions.length, (index) => -1);
  late List<TestExamQuestion> questions;
  late List<int> selectedAnswers;
  late Timer timer;
  int totalTimeInSeconds = 30;

  @override
  void initState() {
    super.initState();
    questions = TestExamData.questions_list;
    selectedAnswers = List.generate(questions.length, (index) => -1);

    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
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
    if(selectedAnswers.contains(-1)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Lỗi'),
            content: Text('Vui lòng trả lời hết các câu hỏi trước khi nộp bài.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Đóng'),
              ),
            ],
          );
        },
      );
    } else {
      submitQuiz();
    }
  }

  void submitQuiz() {
    timer.cancel();
    int score = 0;

    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i].correctAnswerIndex) {
        score++;
      }
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Kết quả'),
          content: Text('Điểm của bạn: $score/${questions.length}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Đóng'),
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
    String formattedTime = '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Đề Thi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          alignment: AlignmentDirectional.topStart,
          children: [
            Container( // Display the timer in the top-right corner
              alignment: Alignment.topRight,
              child: Text(
                // 'Time: ${Duration(seconds: totalTimeInSeconds).toString()}',
                'Time: $formattedTime',
                style: TextStyle(
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
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
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
                    ),
                  ],
                );
              },
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: checkSubmit,
                child: const Text(
                  'Nộp Bài',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
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
