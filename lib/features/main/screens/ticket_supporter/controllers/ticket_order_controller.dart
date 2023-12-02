import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/ticket_supporter/models/ticket_model.dart';
import 'package:ui_project_hochiminh_museum/repository/ticket_supporter_repo/ticket_repository.dart';

class TicketOrderController extends GetxController {
  static TicketOrderController get instance => Get.find();

  final _ticketRepo = Get.put(TicketRepository());

  Future<List<TicketModel>> getAllTicketData() async {
    return await _ticketRepo.queryAllTickets();
  }
}
