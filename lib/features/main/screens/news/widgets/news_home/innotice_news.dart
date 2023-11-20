import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/images/t_rounded_image.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/texts/news_title_home.dart';
// ignore: unused_import
import 'package:ui_project_hochiminh_museum/utils/constants/image_strings.dart';

class InnoticeNews extends StatelessWidget {
  const InnoticeNews({
    required this.imageUrl,
    required this.title,
    super.key,
    required this.onPressed,
  });

  final String imageUrl;
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.only(top: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TRoundedImage(
              imageUrl: imageUrl,
              applyImageRadius: false,
              width: 120,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                width: 200,
                child: NewsTitle(title: title, isNotice: false),
              ),
            )
          ],
        ),
      ),
    );
  }
}
