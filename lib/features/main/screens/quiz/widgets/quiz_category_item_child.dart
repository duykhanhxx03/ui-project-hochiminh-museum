import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';
import 'package:ui_project_hochiminh_museum/utils/helpers/helper_functions.dart';

class QuizCategoryItemChild extends StatelessWidget {
  const QuizCategoryItemChild({
    super.key,
    required this.route,
    required this.title,
  });

  final Widget route;
  final String title;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => route,
            ));
      },
      child: ListTile(
        title: Card(
          color: isDark ? TColors.darkContainer : TColors.lightContainer,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.cardRadiusSm),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ),
    );
  }
}
