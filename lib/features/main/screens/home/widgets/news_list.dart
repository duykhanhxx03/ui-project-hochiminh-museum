import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/home/widgets/news_item_widget.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NewsItemWidget(),
        NewsItemWidget(),
        NewsItemWidget(),
        NewsItemWidget(),
        NewsItemWidget(),
      ],
    );
  }
}
