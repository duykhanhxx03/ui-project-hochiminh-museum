import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/texts/stamp_text.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

class NewsFullTitle extends StatelessWidget {
  const NewsFullTitle({
    required this.title,
    this.fontWeight = FontWeight.bold,
    this.fontSize = TSizes.fontSizeLg,
    this.paddingTop = TSizes.defaultSpace,
    this.color = TColors.primary,
    super.key,
  });

  final String title;
  final double paddingTop;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: paddingTop),
          child: Text(
            title,
            style: TextStyle(
              color: color,
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
          ),
        ),
        const SizedBox(
          /// -- Time and view

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    // -- Time
                    Iconsax.calendar_1,
                    size: 14,
                    color: Colors.grey,
                  ),
                  StampText(content: "8:00AM 29/05/2003"),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    // --Views
                    Iconsax.eye,
                    size: 10,
                    color: Colors.grey,
                  ),
                  StampText(content: '137'),
                ],
              ),
              Row(
                children: [
                  StampText(content: "Cỡ chữ + -"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
