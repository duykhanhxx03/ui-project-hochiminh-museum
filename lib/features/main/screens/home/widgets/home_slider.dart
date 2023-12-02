import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/custom_shape/containers/circular_container.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/images/t_rounded_image.dart';
import 'package:ui_project_hochiminh_museum/features/main/controllers/home_controller.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

class HomeSlider extends StatelessWidget {
  HomeSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          CarouselSlider(
            items: [
              ...banners
                  .map((e) => TRoundedImage(
                        imageUrl: e,
                        padding: const EdgeInsets.all(8.0),
                        fit: BoxFit.cover,
                      ))
                  .toList()
            ],
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                controller.updatePageIndicator(index);
              },
              viewportFraction: 1,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < 3; i++)
                  TCircularContainer(
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    width: 20,
                    backgroundColor: controller.carouseCurrentlIndex.value != i
                        ? TColors.accent
                        : TColors.grey,
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
