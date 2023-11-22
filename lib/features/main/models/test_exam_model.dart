import 'package:cloud_firestore/cloud_firestore.dart';

class TestExamModel {
  final String question;
  final List<dynamic> options;
  final int correctAnswerIndex;

  TestExamModel({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });

  toJson() {
    return {
      'question': question,
      'options': options,
      'correctAnswerIndex': correctAnswerIndex
    };
  }

  factory TestExamModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return TestExamModel(
      question: data['question'],
      options: data['options'],
      correctAnswerIndex: data['correctAnswerIndex'],
    );
  }
}