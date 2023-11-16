import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/images/t_rounded_image.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/texts/news_full_title.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/texts/news_title_home.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/news/widgets/news_home/group_new.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/image_strings.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

class newsScreen extends StatelessWidget {
  const newsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) => GroupNews(),
              itemCount: 4,
            ),
          ),
        ),
      ),
    );
  }
}
