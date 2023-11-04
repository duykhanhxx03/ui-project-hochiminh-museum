import 'package:flutter/material.dart';

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
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => route,
            ));
      },
      child: ListTile(
        title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}
