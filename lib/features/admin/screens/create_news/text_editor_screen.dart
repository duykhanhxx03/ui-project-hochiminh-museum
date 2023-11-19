import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/features/admin/controllers/text_editor_controller.dart';
import 'package:ui_project_hochiminh_museum/features/admin/screens/create_news/widgets/image_editor.dart';
import 'package:ui_project_hochiminh_museum/features/admin/screens/create_news/widgets/new_line_button.dart';
import 'package:ui_project_hochiminh_museum/features/admin/screens/create_news/widgets/text_field.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/image_strings.dart';
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

  // List<String> items = ["Tiêu đề", "Miêu tả", "Đoạn văn", "Ảnh", "Tác giả"];
  List<Map<String, dynamic>> items = [
    {'value': "Tiêu đề", 'icon': Iconsax.text},
    {'value': "Miêu tả", 'icon': Iconsax.message_question},
    {'value': "Đoạn văn", 'icon': Iconsax.document},
    {'value': "Ảnh", 'icon': Iconsax.image},
    {'value': "Tác giả", 'icon': Iconsax.user},
  ];

  void showBottomModal(BuildContext context, List<Map<String, dynamic>> items,
      Function onItemTap) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(items[index]['icon']),
                title: Text(items[index]['value']),
                onTap: () {
                  onItemTap(index);
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }

  void addNewLine(int editsIndex) {
    setState(() {
      showBottomModal(context, items, (index) {
        String uuid = const Uuid().v4();
        textEditorController.element.add(uuid);

        textEditorController.element.insert(editsIndex, uuid);

        switch (index) {
          case 0:
            setState(
              () {
                textEditorController.edits.insert(
                  editsIndex,
                  TextFieldEditor(
                    label: 'Tiêu đề',
                    maxLines: 5,
                    minLines: 3,
                    removeLine: removeLine,
                    key: ValueKey(
                      DateTime.now(),
                    ),
                    type: 'title',
                  ),
                );
                textEditorController.edits.insert(
                  editsIndex,
                  NewLineEditingButton(
                    key: ValueKey(uuid),
                    addNewLine: addNewLine,
                  ),
                );
              },
            );
            break;
          case 1:
            setState(
              () {
                textEditorController.edits.insert(
                  editsIndex,
                  TextFieldEditor(
                    label: 'Miêu tả',
                    maxLines: 7,
                    minLines: 5,
                    removeLine: removeLine,
                    key: ValueKey(
                      DateTime.now(),
                    ),
                    type: 'description',
                  ),
                );
                textEditorController.edits.insert(
                  editsIndex,
                  NewLineEditingButton(
                    key: ValueKey(uuid),
                    addNewLine: addNewLine,
                  ),
                );
              },
            );
            break;
          case 2:
            setState(
              () {
                textEditorController.edits.insert(
                  editsIndex,
                  TextFieldEditor(
                    label: 'Đoạn văn',
                    maxLines: 15,
                    minLines: 7,
                    removeLine: removeLine,
                    key: ValueKey(
                      DateTime.now(),
                    ),
                    type: 'paragraph',
                  ),
                );
                textEditorController.edits.insert(
                  editsIndex,
                  NewLineEditingButton(
                    key: ValueKey(uuid),
                    addNewLine: addNewLine,
                  ),
                );
              },
            );
            break;

          case 3:
            setState(
              () {
                textEditorController.edits.insert(
                  editsIndex,
                  ImageEditor(
                    key: ValueKey(DateTime.now()),
                    removeLine: removeLine,
                    imageUrl: TImages.acerlogo,
                  ),
                );
                textEditorController.edits.insert(
                  editsIndex,
                  NewLineEditingButton(
                    key: ValueKey(uuid),
                    addNewLine: addNewLine,
                  ),
                );
              },
            );
            break;
          case 4:
            setState(
              () {
                textEditorController.edits.insert(
                  editsIndex,
                  TextFieldEditor(
                    label: 'Tác giả',
                    maxLines: 2,
                    minLines: 1,
                    removeLine: removeLine,
                    key: ValueKey(
                      DateTime.now(),
                    ),
                    type: 'author',
                  ),
                );
                textEditorController.edits.insert(
                  editsIndex,
                  NewLineEditingButton(
                    key: ValueKey(uuid),
                    addNewLine: addNewLine,
                  ),
                );
              },
            );
            break;
        }
      });
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
        actions: [
          IconButton(
            onPressed: () {
              print(textEditorController.getInfo());
            },
            icon: const Icon(Iconsax.add),
          ),
        ],
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
