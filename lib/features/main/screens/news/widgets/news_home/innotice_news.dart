import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/images/t_rounded_image.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/texts/news_title_home.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
// ignore: unused_import
import 'package:ui_project_hochiminh_museum/utils/constants/image_strings.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

class InnoticeNews extends StatelessWidget {
  const InnoticeNews({
    required this.thumbnailUrl,
    required this.title,
    super.key,
    required this.onPressed,
    required this.isNetworkImage,
    required this.date,
    this.isVideo,
  });

  final String thumbnailUrl;
  final String date;
  final bool isNetworkImage;
  final String title;
  final void Function() onPressed;
  final bool? isVideo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 105,
        padding: const EdgeInsets.all(TSizes.spaceBtwElements),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                TRoundedImage(
                  imageUrl: thumbnailUrl,
                  applyImageRadius: true,
                  borderRadius: 3,
                  height: 100,
                  width: 130,
                  fit: BoxFit.cover,
                  isNetworkImage: isNetworkImage,
                ),
                if (isVideo != null)
                  const Positioned(
                    child: Icon(Iconsax.video_circle, color: TColors.white),
                  )
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: double.infinity,
                        child: NewsTitle(
                          title: title,
                          isNotice: false,
                          maxLines: 3,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Iconsax.clock,
                            size: 10,
                            color: Colors.grey,
                          ),
                          Text(
                            " $date",
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
