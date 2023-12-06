class NotificationsMessageModel {
  final String? title;
  final String? body;
  final dynamic data;
  final DateTime? timestamp;
  NotificationsMessageModel({this.title, this.body, this.data, this.timestamp});

  toJson() {
    return {
      'title': title,
      'body': body,
      'data': data,
      // 'timestamp': timestamp,
    };
  }

  fromJson(jsonData) {
    return NotificationsMessageModel(
        title: jsonData['title'],
        body: jsonData['body'],
        // timestamp: jsonData['timestamp'],
        data: jsonData['data']);
  }
}
