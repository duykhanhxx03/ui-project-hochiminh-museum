import 'package:cloud_firestore/cloud_firestore.dart';

class TicketModel {
  final String userId;
  final String name;
  final String phoneNumber;
  final String date;
  final int quantities;

  TicketModel(
      {required this.name,
      required this.phoneNumber,
      required this.date,
      required this.quantities,
      required this.userId});

  toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'date': date,
      'quantities': quantities,
      'userId': userId,
    };
  }

  factory TicketModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return TicketModel(
        name: data['name'],
        phoneNumber: data['phoneNumber'],
        date: data['date'],
        quantities: data['quantities'],
        userId: data['userId']);
  }
}
