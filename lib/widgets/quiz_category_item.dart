import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';

class QuizCategoryItem extends StatelessWidget {
  const QuizCategoryItem({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final List<Widget> child;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Card(
        color: TColors.primary,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
      children: [
        ...child,
      ],
    );
  }
}
