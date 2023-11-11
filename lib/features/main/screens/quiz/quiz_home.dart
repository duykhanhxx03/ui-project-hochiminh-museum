import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/data/test_exam_data.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/test.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/revision.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/helpers/helper_functions.dart';
import 'widgets/quiz_category_item.dart';
import 'widgets/quiz_category_item_child.dart';

class QuizHome extends StatelessWidget {
  const QuizHome({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        leading:
            Icon(Iconsax.teacher, color: isDark ? TColors.light : TColors.dark),
        title: Text(
          'Quiz',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          QuizCategoryItem(
            title: 'Đề thi',
            child: [
              QuizCategoryItemChild(
                route: TestExamScreen(questions: TestExamData.questionsList1),
                title: 'Đề thi 1',
              ),
              QuizCategoryItemChild(
                route: TestExamScreen(questions: TestExamData.questionsList2),
                title: 'Đề thi 2',
              ),
            ],
          ),
          QuizCategoryItem(
            title: 'Ôn tập',
            child: [
              QuizCategoryItemChild(
                route: RevisionScreen(
                  questions: TestExamData.questionsList1,
                ),
                title: 'Bộ câu hỏi 1',
              ),
              QuizCategoryItemChild(
                route: RevisionScreen(
                  questions: TestExamData.questionsList2,
                ),
                title: 'Bộ câu hỏi 2',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
