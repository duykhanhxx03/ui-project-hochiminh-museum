class TestExamQuestion {
  String question;
  List<String> options;
  int correctAnswerIndex;

  TestExamQuestion({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });
}

class TestExamData {
  static List<TestExamQuestion> questions_list = [
    TestExamQuestion(
      question: 'Flutter là gì?',
      options: ['Framework phát triển ứng dụng di động', 'Ngôn ngữ lập trình', 'Thư viện quản lý trạng thái'],
      correctAnswerIndex: 0,
    ),
    TestExamQuestion(
      question: 'Dart là ngôn ngữ lập trình nào?',
      options: ['Java', 'C++', 'Dart'],
      correctAnswerIndex: 2,
    ),
    TestExamQuestion(
      question: 'Flutter sử dụng framework gì?',
      options: ['React Native', 'Angular', 'Flutter'],
      correctAnswerIndex: 2,
    ),
    TestExamQuestion(
      question: 'Flutter gì?',
      options: ['Framework phát triển ứng dụng di động', 'Ngôn ngữ lập trình', 'Thư viện quản lý trạng thái'],
      correctAnswerIndex: 0,
    ),
    TestExamQuestion(
      question: 'Dart là lập trình nào?',
      options: ['Java', 'C++', 'Dart'],
      correctAnswerIndex: 2,
    ),
    TestExamQuestion(
      question: 'Flutter',
      options: ['React Native', 'Angular', 'Flutter'],
      correctAnswerIndex: 2,
    ),
    TestExamQuestion(
      question: 'Flutter gì?',
      options: ['Framework phát triển ứng dụng di động', 'Ngôn ngữ lập trình', 'Thư viện quản lý trạng thái'],
      correctAnswerIndex: 0,
    ),
    TestExamQuestion(
      question: 'Dart là lập trình nào?',
      options: ['Java', 'C++', 'Dart'],
      correctAnswerIndex: 2,
    ),
    TestExamQuestion(
      question: 'Flutter',
      options: ['React Native', 'Angular', 'Flutter'],
      correctAnswerIndex: 2,
    ),
    TestExamQuestion(
      question: 'Flutter',
      options: ['React Native', 'Angular', 'Flutter'],
      correctAnswerIndex: 2,
    ),
  ];
}