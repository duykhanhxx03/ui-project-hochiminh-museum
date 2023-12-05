import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ui_project_hochiminh_museum/features/notifications/notifiactions_model.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    List<NotificationsMessageModel> listNoti = GetStorage().read('noti');
    return Scaffold(
        appBar: AppBar(title: const Text("Notifications")),
        body: ListView.separated(
          itemCount: listNoti.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  prefixIcon(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          message(index),
                          const SizedBox(
                            height: 10,
                          ),
                          timeAndDate(index),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              height: 10,
            );
          },
        ));
  }

  Container prefixIcon() {
    return Container(
      height: 50,
      width: 50,
      padding: const EdgeInsets.all(10),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Colors.grey.shade300),
      child: Icon(
        Icons.notifications,
        size: 25,
        color: Colors.grey.shade700,
      ),
    );
  }

  RichText message(int index) {
    return RichText(
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      text: const TextSpan(
          text: 'Messenger',
          style: TextStyle(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: " messenger Description",
                style: TextStyle(fontWeight: FontWeight.w400))
          ]),
    );
  }

  Container timeAndDate(int index) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '23-91-2021',
              style: TextStyle(fontSize: 10),
            ),
            Text(
              '07:10 am',
              style: TextStyle(fontSize: 10),
            ),
          ]),
    );
  }
}
