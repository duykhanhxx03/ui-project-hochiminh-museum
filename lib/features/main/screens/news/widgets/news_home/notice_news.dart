import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/images/t_rounded_image.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/texts/news_title_home.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

class ProminentNews extends StatelessWidget {
  const ProminentNews({
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.view,
    required this.content,
    required this.isNotice,
    super.key,
    required this.onPressed,
  });

  final String imageUrl;
  final String title;
  final String date;
  final int view;
  final String content;
  final bool isNotice;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TRoundedImage(
            onPressed: onPressed,
            imageUrl: imageUrl,
            applyImageRadius: false,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(
            height: TSizes.spaceBtwElements,
          ),
          NewsTitle(title: title, isNotice: isNotice),
          const SizedBox(
            height: TSizes.spaceBtwElements,
          ),
          SizedBox(
            /// -- Time and view
            width: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Iconsax.clock,
                      size: 10,
                      color: Colors.grey,
                    ),
                    Text(
                      " $date",
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Iconsax.eye,
                      size: 10,
                      color: Colors.grey,
                    ),
                    Text(
                      ' $view lượt',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwElements,
          ),
          Text(
            content,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}
