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
      'phone_number': phoneNumber,
      'date': date,
      'quantites': quantities,
      'userId': userId,
    };
  }
}
