import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/images/t_rounded_image.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/texts/news_title_home.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/texts/stamp_text.dart';
// ignore: unused_import
import 'package:ui_project_hochiminh_museum/utils/constants/image_strings.dart';

class InnoticeNews extends StatelessWidget {
  const InnoticeNews({
    required this.thumbnailUrl,
    required this.title,
    super.key,
    required this.onPressed,
    required this.isNetworkImage,
    required this.date,
  });

  final String thumbnailUrl;
  final String date;
  final bool isNetworkImage;
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.only(top: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TRoundedImage(
              imageUrl: thumbnailUrl,
              applyImageRadius: false,
              width: 120,
              isNetworkImage: isNetworkImage,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    width: 200,
                    child: NewsTitle(title: title, isNotice: false),
                  ),
                ),
                StampText(content: date),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
