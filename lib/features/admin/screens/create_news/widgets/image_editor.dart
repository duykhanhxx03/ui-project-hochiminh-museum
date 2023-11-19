import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/features/admin/controllers/text_editor_controller.dart';
import 'package:ui_project_hochiminh_museum/features/admin/screens/create_news/models/get_type.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

// ignore: must_be_immutable
class ImageEditor extends StatelessWidget implements GetType {
  ImageEditor({
    super.key,
    required this.removeLine,
    required this.imageUrl,
  });

  final void Function(int) removeLine;
  var textEditorController = Get.put(TextEditorController());
  final String imageUrl;

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 9,
              child: Image(
                fit: BoxFit.contain,
                image: AssetImage(imageUrl),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            IconButton(
              onPressed: () {
                removeLine(textEditorController.edits.indexOf(this));
              },
              icon: const Icon(Iconsax.minus),
              style: OutlinedButton.styleFrom(),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: TSizes.defaultSpace),
          child: TextField(
            controller: controller,
            maxLines: 2,
            minLines: 1,
            decoration: const InputDecoration(
              labelText: 'Tiêu đề ảnh',
            ),
          ),
        ),
      ],
    );
  }

  @override
  Map<String, String> getType() {
    return {
      'type': 'image',
      'image_url': imageUrl,
      'image_descrtiption': controller.text,
    };
  }
}
