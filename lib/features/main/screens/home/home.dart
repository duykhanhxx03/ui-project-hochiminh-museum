import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/custom_shape/containers/primary_header_container.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/home/widgets/categories_list.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/image_strings.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

import 'widgets/home_app_bar.dart';
import 'widgets/home_slider.dart';
import 'widgets/news_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  const HomeAppBar(),
                  Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: HomeSlider(
                      banners: const [
                        TImages.promoBanner2,
                        TImages.promoBanner1,
                        TImages.promoBanner3,
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                ],
              ),
            ),
            CategoriesList(),
            const NewsList(),
          ],
        ),
      ),
    );
  }
}
