import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/features/admin/screens/create_news/models/get_type.dart';

class TextEditorController extends GetxController {
  static TextEditorController get instance => Get.find();

  RxList<dynamic> element = [].obs;
  RxList edits = [].obs;

  List getInfo() {
    var res = [];
    for (var i in edits) {
      var element = i as GetType;
      res.addIf(element.getType()['type'] != 'ignore', element.getType());
    }
    return res;
  }
}
