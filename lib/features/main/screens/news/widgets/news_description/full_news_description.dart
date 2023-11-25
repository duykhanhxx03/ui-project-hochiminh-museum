import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/texts/news_full_title.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/news/controllers/news_description_controller.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

// ignore: must_be_immutable
class FullNewsDescription extends StatelessWidget {
  FullNewsDescription({super.key, this.newsContent});

  List<dynamic>? newsContent;
  final DescriptionController c = Get.put(DescriptionController());
  List<Widget> ui = [];

  @override
  Widget build(BuildContext context) {
    for (dynamic item in newsContent!) {
      switch (item['type']) {
        case 'title':
          ui.add(NewsFullTitle(title: item['content']));
          break;
        case 'description':
          ui.add(
            Text(
              item['content'],
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          );
          break;
        case 'paragraph':
          ui.add(
            Text(
              item['content'],
              style: const TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
          );
          break;
        case 'image':
          ui.add(
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: FadeInImage.memoryNetwork(
                    fit: BoxFit.contain,
                    placeholder: kTransparentImage,
                    image: item['image_url'],
                  ),
                ),
                Text(item['image_descrtiption']),
              ],
            ),
          );
          break;
        case 'author':
          ui.add(
            Row(children: [
              const Spacer(),
              Text(
                item['content'],
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ]),
          );
          break;
        default:
          // Handle invalid types
          if (kDebugMode) {
            print('Invalid content type: ${item['type']}');
          }
          break;
      }
      ui.add(
        const SizedBox(
          height: TSizes.spaceBtwElements,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...ui
        // NewsFullTitle(fontSize: 20, title: news.title),
        // const Divider(
        //   thickness: 0.7,
        // ),
        // const SizedBox(
        //   height: TSizes.spaceBtwElements,
        // ),
        // Text(
        //   news.recap,
        //   style: const TextStyle(fontWeight: FontWeight.w600),
        // ),
        // ImageWithDesWidget(image: news.listImage[0]),
        // Text(news.content, textAlign: TextAlign.justify),
      ],
    );
  }
}
