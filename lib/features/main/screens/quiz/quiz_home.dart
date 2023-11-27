import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/data/test_exam_data.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/quiz/controllers/test_exam_controller.dart';
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
    final controller = Get.put(TestExamController());
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
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: Future.wait([
              controller.getTestExamData('DeThi1'),
              controller.getTestExamData('DeThi2')
            ]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  final data = snapshot.data!;
                  TestExamData.questionsList1 = data[0];
                  TestExamData.questionsList2 = data[1];
                  return ListView(
                    shrinkWrap: true,
                    children: [
                      QuizCategoryItem(
                        title: 'Đề thi',
                        child: [
                          QuizCategoryItemChild(
                            route: TestExamScreen(
                                questions: TestExamData.questionsList1),
                            title: 'Đề thi 1',
                          ),
                          QuizCategoryItemChild(
                            route: TestExamScreen(
                                questions: TestExamData.questionsList2),
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
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
