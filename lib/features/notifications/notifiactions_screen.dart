import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/features/notifications/notifiactions_model.dart';
import 'package:ui_project_hochiminh_museum/utils/helpers/helper_functions.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({
    super.key,
  });

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationsMessageModel> notificationsList = [];
  final box = GetStorage("app-notifications");

  void reload() {
    setState(() {
      notificationsList = [];
      var jsonArray = box.read("notifications");
      if (jsonArray != null) {
        List dataList = jsonDecode(jsonArray);
        for (var data in dataList) {
          notificationsList.add(NotificationsMessageModel().fromJson(data));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    reload();
    return Scaffold(
      appBar: TAppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Text("Thông báo "),
                Icon(
                  Icons.notifications,
                  size: 18,
                )
              ],
            ),
            IconButton(
              onPressed: () {
                final box = GetStorage("app-notifications");
                box.remove('notifications');
                reload();
              },
              icon: const Icon(Iconsax.broom),
            ),
          ],
        ),
        showBackArrow: true,
      ),
      body: notificationsList.isEmpty
          ? RefreshIndicator(
              onRefresh: () async {
                reload();
              },
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  Center(
                    child: SizedBox(
                      height: THelperFunctions.screenHeight() - 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade300),
                            child: Icon(
                              Icons.notifications_off,
                              size: 100,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text("Bạn không có thông báo nào cả"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : RefreshIndicator(
              onRefresh: () async {
                // (context as Element).reassemble();
                reload();
              },
              child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: notificationsList.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade300),
                          child: Icon(
                            Icons.notifications,
                            size: 25,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                      text: notificationsList[index].title,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: [
                                        TextSpan(
                                            text:
                                                "\n${notificationsList[index].body}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12,
                                                fontStyle: FontStyle.italic))
                                      ]),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          notificationsList[index].date!,
                                          style: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.blueAccent),
                                        ),
                                        Text(
                                          notificationsList[index].time!,
                                          style: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.blueAccent),
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
