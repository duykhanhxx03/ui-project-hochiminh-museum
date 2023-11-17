import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/features/admin/controllers/text_editor_controller.dart';
import 'package:ui_project_hochiminh_museum/features/admin/screens/create_news/models/get_type.dart';

class NewLineEditingButton extends StatefulWidget implements GetType {
  const NewLineEditingButton({
    super.key,
    required this.addNewLine,
  });

  final void Function(int) addNewLine;

  @override
  State<NewLineEditingButton> createState() => _NewLineEditingButtonState();

  @override
  Map<String, String> getType() {
    return {
      'type': 'ignore',
    };
  }
}

class _NewLineEditingButtonState extends State<NewLineEditingButton> {
  var textEditorController = Get.put(TextEditorController());

  @override
  Widget build(BuildContext context) {
    // print(textEditorController.element.length);
    return Container(
      decoration: const BoxDecoration(),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              widget.addNewLine(
                textEditorController.edits.indexOf(widget),
              );
            },
            icon: const Icon(Iconsax.add),
            style: OutlinedButton.styleFrom(),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
