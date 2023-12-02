import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/ticket_supporter/models/ticket_model.dart';
import 'package:ui_project_hochiminh_museum/repository/authentication_repository/authentication_repository.dart';
import 'package:ui_project_hochiminh_museum/repository/authentication_repository/user_repository.dart';
import 'package:ui_project_hochiminh_museum/repository/ticket_supporter_repo/ticket_repository.dart';

class TicketRegisterController extends GetxController {
  static TicketRegisterController get instance => Get.find();

  final _repoVisitor = Get.put(TicketRepository());
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserData() async {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return await _userRepo.getUserDetails(email);
    } else {
      Get.snackbar('Lỗi', 'Không lấy được datas');
    }
  }

  var counterQuantities = 1.obs;
  var dateRegister = DateFormat("dd-MM-yyyy").format(DateTime.now()).obs;
  var email = "".obs;
  var name = "".obs;
  var phoneNumber = "".obs;
  var userId = "".obs;

  void reset() {
    counterQuantities.value = 1;
  }

  createTicket(TicketModel model) {
    _repoVisitor.creatTicketRegister(model);
  }
}
