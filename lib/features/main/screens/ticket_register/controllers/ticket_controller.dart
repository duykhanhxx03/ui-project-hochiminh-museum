import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/ticket_register/models/ticket_model.dart';
import 'package:ui_project_hochiminh_museum/repository/visitor_register_repo/visitor_repository.dart';

class TicketController extends GetxController {
  static TicketController get instance => Get.find();

  final _repoVisitor = Get.put(TicketRepository());
  var counterQuantities = 1.obs;
  var dateRegister = DateFormat("dd-MM-yyyy").format(DateTime.now()).obs;
  var email = "dayladinhducthuan".obs;
  var name = "Dinh Duc Thuan".obs;
  var phoneNumber = "16158464465561".obs;
  var userId = "adafsd445".obs;

  void reset() {
    counterQuantities.value = 1;
  }

  createTicket(TicketModel model) {
    _repoVisitor.creatTicketRegister(model);
  }
}
