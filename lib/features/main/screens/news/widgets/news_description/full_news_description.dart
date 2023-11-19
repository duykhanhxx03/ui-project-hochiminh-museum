import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/common/models/imageWithDes_model.dart';
import 'package:ui_project_hochiminh_museum/common/models/news.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/images/t_rounded_image.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/texts/news_full_title.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/texts/stamp_text.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/news/controllers/news_description_controller.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/news/widgets/news_description/ImageWithDescription.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/image_strings.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

class FullNewsDescription extends StatelessWidget {
  FullNewsDescription({
    required this.news,
    super.key,
  });

  final News news;
  final DescriptionController c = Get.put(DescriptionController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewsFullTitle(fontSize: 20, title: news.title),
        const Divider(
          thickness: 0.7,
        ),
        SizedBox(
          /// -- Time and view

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    // -- Time
                    Iconsax.calendar_1,
                    size: 14,
                    color: Colors.grey,
                  ),
                  stampText(content: "${news.time} ${news.date}"),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    // --Views
                    Iconsax.eye,
                    size: 10,
                    color: Colors.grey,
                  ),
                  stampText(content: news.views.toString()),
                ],
              ),
              Row(
                children: [
                  stampText(content: "Cỡ chữ + -"),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwElements,
        ),
        Text(
          news.recap,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        ImageWithDesWidget(image: news.listImage[0]),
        Text(news.content, textAlign: TextAlign.justify),
      ],
    );
  }
}
