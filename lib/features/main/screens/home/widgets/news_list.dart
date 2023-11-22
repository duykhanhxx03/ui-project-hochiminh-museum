import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/news/widgets/news_home/group_new.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) => const GroupNews(),
        itemCount: 4,
      ),
    );
  }
}
