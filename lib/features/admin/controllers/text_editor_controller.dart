import 'package:get/get.dart';

class TextEditorController extends GetxController {
  static TextEditorController get instance => Get.find();

  RxList<dynamic> element = [].obs;
  RxList edits = [].obs;

  int getCurrentIndex(String uuid) {
    print('----index---');
    print(element.indexOf(uuid));
    print('----index---');

    return element.indexOf(uuid);
  }
}
