import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/features/admin/controllers/text_editor_controller.dart';
import 'package:ui_project_hochiminh_museum/features/admin/screens/create_news/widgets/new_line_button.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';
import 'package:uuid/uuid.dart';

class TextEditorScreen extends StatefulWidget {
  const TextEditorScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TextEditorScreenState createState() => _TextEditorScreenState();
}

class _TextEditorScreenState extends State<TextEditorScreen> {
  var textEditorController = Get.put(TextEditorController());

  @override
  void initState() {
    super.initState();
    var uuid = const Uuid().v4();
    textEditorController.edits.add(
      NewLineEditingButton(
        addNewLine: addNewLine,
      ),
    );
    textEditorController.element.add(uuid);
  }

  void removeLine(int index) {
    setState(() {
      textEditorController.edits.removeAt(index);
      textEditorController.edits.removeAt(index);
    });
  }

  void addNewLine(int index) {
    String uuid = const Uuid().v4();
    textEditorController.element.add(uuid);

    textEditorController.element.insert(index, uuid);
    setState(() {
      textEditorController.edits.insert(
        index,
        TextFieldWithMinusButton(
          removeLine: removeLine,
          key: ValueKey(
            DateTime.now(),
          ),
        ),
      );
      textEditorController.edits.insert(
        index,
        NewLineEditingButton(
          key: ValueKey(uuid),
          addNewLine: addNewLine,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'TextEditor',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.only(
            left: TSizes.defaultSpace,
            top: TSizes.defaultSpace,
            bottom: TSizes.defaultSpace,
          ),
          child: ListView(
            children: [
              ...textEditorController.edits,
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TextFieldWithMinusButton extends StatelessWidget {
  TextFieldWithMinusButton({
    super.key,
    required this.removeLine,
  });

  final void Function(int) removeLine;
  var textEditorController = Get.put(TextEditorController());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 9,
          child: TextField(
            maxLines: 10,
            minLines: 3,
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
}
