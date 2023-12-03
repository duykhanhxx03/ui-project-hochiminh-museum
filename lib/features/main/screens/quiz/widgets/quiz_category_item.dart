import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

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
        elevation: 0,
        color: TColors.primary,
        child: Padding(
          padding: const EdgeInsets.all(TSizes.cardRadiusMd),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: TColors.textWhite),
          ),
        ),
      ),
      children: [
        ...child,
      ],
    );
  }
}
