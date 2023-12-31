import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/revision_screen/widgets/question_summary/summary_item.dart';

class QuestionSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionSummary({super.key, required this.summaryData});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summaryData.map(
              (data) {
                return SummaryItem(itemData: data);
              },
            ).toList(),
          ],
        ),
      ),
    );
  }
}
