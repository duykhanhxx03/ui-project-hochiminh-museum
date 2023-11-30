import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/ticket_supporter/models/ticket_model.dart';

class TicketRepository extends GetxController {
  final _db = FirebaseFirestore.instance;

  creatTicketRegister(TicketModel model) async {
    await _db
        .collection('DangKyThamQuan')
        .add(model.toJson())
        .whenComplete(
          () => Get.snackbar(
            'Thành công',
            'Bạn đã đăng ký tham quan thành công',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green,
          ),
        )
        .catchError((error, stacktrace) {
      () => Get.snackbar(
            'Lỗi',
            'Hãy kiểm tra lại thông tin và thử lại',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red,
          );
      print(error.toString());
    });
  }

  Future<List<TicketModel>> queryAllTickets() async {
    final snapshot = await _db.collection('DangKyThamQuan').get();
    final ticketData =
        snapshot.docs.map((e) => TicketModel.fromSnapShot(e)).toList();
    return ticketData;
  }
}
