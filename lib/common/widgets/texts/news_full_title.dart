import 'package:flutter/material.dart';
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
    return Padding(
      padding: EdgeInsets.only(top: paddingTop),
      child: Text(
        title,
        style:
            TextStyle(color: color, fontWeight: fontWeight, fontSize: fontSize),
      ),
    );
  }
}
