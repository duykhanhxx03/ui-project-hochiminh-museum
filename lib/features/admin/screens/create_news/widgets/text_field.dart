import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/features/admin/controllers/text_editor_controller.dart';
import 'package:ui_project_hochiminh_museum/features/admin/screens/create_news/models/get_type.dart';

// ignore: must_be_immutable
class TextFieldEditor extends StatelessWidget implements GetType {
  TextFieldEditor({
    super.key,
    required this.removeLine,
    required this.minLines,
    required this.maxLines,
    required this.label,
    required this.type,
  });

  final int minLines;
  final int maxLines;
  final String label;
  final String type;

  final void Function(int) removeLine;
  final textEditorController = Get.put(TextEditorController());
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 9,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(labelText: label),
            maxLines: maxLines,
            minLines: minLines,
          ),
        ),
        IconButton(
          onPressed: () {
            removeLine(textEditorController.edits.indexOf(this));
          },
          icon: const Icon(Iconsax.minus),
          style: OutlinedButton.styleFrom(),
        ),
      ],
    );
  }

  @override
  Map<String, String> getType() {
    return {
      'type': type,
      'content': controller.text,
    };
  }
}
