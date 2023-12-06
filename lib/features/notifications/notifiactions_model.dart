class NotificationsMessageModel {
  final String title;
  final String body;
  final dynamic data;
  final DateTime timestamp;
  NotificationsMessageModel(
      {required this.title,
      required this.body,
      this.data,
      required this.timestamp});
}
