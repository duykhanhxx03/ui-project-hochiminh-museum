class NotificationsMessageModel {
  final String? title;
  final String? body;
  final dynamic data;
  final String? date;
  final String? time;
  NotificationsMessageModel(
      {this.title, this.body, this.data, this.date, this.time});

  toJson() {
    return {
      'title': title,
      'body': body,
      'data': data,
      'date': date,
      'time': time
    };
  }

  fromJson(jsonData) {
    return NotificationsMessageModel(
        title: jsonData['title'],
        body: jsonData['body'],
        data: jsonData['data'],
        date: jsonData['date'],
        time: jsonData['time']);
  }
}
