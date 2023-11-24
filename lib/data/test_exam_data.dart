import 'dart:async';

import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/features/main/models/test_exam_model.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/controllers/test_exam_controller.dart';
import 'package:ui_project_hochiminh_museum/repository/test_exam_repository/test_exam_repository.dart';

import '../features/main/screens/quiz/models/test_exam_question.dart';

class TestExamData extends GetxController{
  static late List<TestExamModel> questionsList1;
  static late List<TestExamModel> questionsList2;
  // ignore: non_constant_identifier_names
  // static final List<TestExamQuestion> questionsList1 = [
  //   TestExamQuestion(
  //     question: 'Flutter là gì? Đề 1',
  //     options: [
  //       'Framework phát triển ứng dụng di động',
  //       'Ngôn ngữ lập trình',
  //       'Thư viện quản lý trạng thái'
  //     ],
  //     correctAnswerIndex: 0,
  //   ),
  //   TestExamQuestion(
  //     question: 'Dart là ngôn ngữ lập trình nào?',
  //     options: ['Java', 'C++', 'Dart'],
  //     correctAnswerIndex: 2,
  //   ),
  //   TestExamQuestion(
  //     question: 'Flutter sử dụng framework gì?',
  //     options: ['React Native', 'Angular', 'Flutter'],
  //     correctAnswerIndex: 2,
  //   ),
  //   TestExamQuestion(
  //     question: 'Flutter là gì?',
  //     options: [
  //       'Framework phát triển ứng dụng di động',
  //       'Ngôn ngữ lập trình',
  //       'Thư viện quản lý trạng thái'
  //     ],
  //     correctAnswerIndex: 0,
  //   ),
  //   TestExamQuestion(
  //     question: 'Dart là lập trình nào?',
  //     options: ['Java', 'C++', 'Dart'],
  //     correctAnswerIndex: 2,
  //   ),
  //   TestExamQuestion(
  //     question: 'Flutter',
  //     options: ['React Native', 'Angular', 'Flutter'],
  //     correctAnswerIndex: 2,
  //   ),
  //   TestExamQuestion(
  //     question: 'Flutter gì?',
  //     options: [
  //       'Framework phát triển ứng dụng di động',
  //       'Ngôn ngữ lập trình',
  //       'Thư viện quản lý trạng thái'
  //     ],
  //     correctAnswerIndex: 0,
  //   ),
  //   TestExamQuestion(
  //     question: 'Dart là lập trình nào?',
  //     options: ['Java', 'C++', 'Dart'],
  //     correctAnswerIndex: 2,
  //   ),
  //   TestExamQuestion(
  //     question: 'Flutter',
  //     options: ['React Native', 'Angular', 'Flutter'],
  //     correctAnswerIndex: 2,
  //   ),
  //   TestExamQuestion(
  //     question: 'Flutter',
  //     options: ['React Native', 'Angular', 'Flutter'],
  //     correctAnswerIndex: 2,
  //   ),
  // ];
  //
  // static final List<TestExamQuestion> questionsList2 = [
  //   TestExamQuestion(
  //     question: 'Flutter là gì? (Đề 2)',
  //     options: [
  //       'Framework phát triển ứng dụng di động',
  //       'Ngôn ngữ lập trình',
  //       'Thư viện quản lý trạng thái'
  //     ],
  //     correctAnswerIndex: 0,
  //   ),
  //   TestExamQuestion(
  //     question: 'Dart là ngôn ngữ lập trình nào?',
  //     options: ['Java', 'C++', 'Dart'],
  //     correctAnswerIndex: 2,
  //   ),
  //   TestExamQuestion(
  //     question: 'Flutter sử dụng framework gì?',
  //     options: ['React Native', 'Angular', 'Flutter'],
  //     correctAnswerIndex: 2,
  //   ),
  //   TestExamQuestion(
  //     question: 'Flutter gì?',
  //     options: [
  //       'Framework phát triển ứng dụng di động',
  //       'Ngôn ngữ lập trình',
  //       'Thư viện quản lý trạng thái'
  //     ],
  //     correctAnswerIndex: 0,
  //   ),
  //   TestExamQuestion(
  //     question: 'Dart là lập trình nào?',
  //     options: ['Java', 'C++', 'Dart'],
  //     correctAnswerIndex: 2,
  //   ),
  //   TestExamQuestion(
  //     question: 'Flutter',
  //     options: ['React Native', 'Angular', 'Flutter'],
  //     correctAnswerIndex: 2,
  //   ),
  //   TestExamQuestion(
  //     question: 'Flutter gì?',
  //     options: [
  //       'Framework phát triển ứng dụng di động',
  //       'Ngôn ngữ lập trình',
  //       'Thư viện quản lý trạng thái'
  //     ],
  //     correctAnswerIndex: 0,
  //   ),
  //   TestExamQuestion(
  //     question: 'Dart là lập trình nào?',
  //     options: ['Java', 'C++', 'Dart'],
  //     correctAnswerIndex: 2,
  //   ),
  //   TestExamQuestion(
  //     question: 'Flutter',
  //     options: ['React Native', 'Angular', 'Flutter'],
  //     correctAnswerIndex: 2,
  //   ),
  //   TestExamQuestion(
  //     question: 'Flutter',
  //     options: ['React Native', 'Angular', 'Flutter'],
  //     correctAnswerIndex: 2,
  //   ),
  // ];
}
