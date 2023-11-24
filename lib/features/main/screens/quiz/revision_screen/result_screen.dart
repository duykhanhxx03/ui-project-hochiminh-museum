// import 'package:flutter/material.dart';

// class ResultScreen extends StatelessWidget {
//   const ResultScreen(
//       {super.key, required this.choosenAnswers, required this.restart});

//   final List<String> choosenAnswers;
//   final void Function() restart;

//   List<Map<String, Object>> getSummaryData() {
//     final List<Map<String, Object>> summary = [];
//     for (var i = 0; i < choosenAnswers.length; i++) {
//       summary.add({
//         'question_index': i,
//         'question': questions[i].text,
//         'correct_answer': questions[i].answers[0],
//         'user_answer': choosenAnswers[i]
//       });
//     }
//     return summary;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final summaryData = getSummaryData();
//     final numTotalQuestions = questions.length;
//     final numCorrectQuestions = summaryData
//         .where((data) => data['user_answer'] == data['correct_answer'])
//         .length;

//     return SizedBox(
//       width: double.infinity,
//       child: Container(
//         margin: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'You answer $numCorrectQuestions out of $numTotalQuestions questions correctly!',
//               style: GoogleFonts.lato(
//                 color: const Color.fromARGB(255, 230, 200, 253),
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             QuestionSummary(
//               summaryData: summaryData,
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             TextButton.icon(
//               onPressed: () {
//                 restart();
//               },
//               style: TextButton.styleFrom(
//                 foregroundColor: Colors.white,
//               ),
//               label: const Text('Restart Quiz'),
//               icon: const Icon(Icons.refresh),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
