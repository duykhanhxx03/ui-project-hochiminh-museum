import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/loading/custom_loading.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/ticket_supporter/controllers/ticket_order_controller.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/ticket_supporter/models/ticket_model.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/ticket_supporter/widgets/orders_list.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

class TicketOrderScreen extends StatelessWidget {
  TicketOrderScreen({Key? key}) : super(key: key);

  final controller = Get.put(TicketOrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text("Lịch sử mua vé"),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: FutureBuilder(
          future: controller.getAllTicketData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                List<TicketModel> orderData = snapshot.data!;
                return TOrderListItems(
                  listTicket: orderData,
                );
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                return const Center(child: Text("smt went wrong"));
              }
            } else {
              return const Center(
                child: CustomLoading(),
              );
            }
          },
        ),
      ),
    );
  }
}
