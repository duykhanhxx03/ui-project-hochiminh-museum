import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/custom_shape/containers/primary_header_container.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/home/widgets/categories_list.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/image_strings.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

import 'widgets/home_app_bar.dart';
import 'widgets/home_slider.dart';
import 'widgets/news_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  HomeAppBar(),
                  Padding(
                    padding: EdgeInsets.all(TSizes.defaultSpace),
                    child: HomeSlider(banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3,
                    ]),
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),
                ],
              ),
            ),
            CategoriesList(),
            NewsList(),
          ],
        ),
      ),
    );
  }
}
