import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/ticket_register/controllers/ticket_controller.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/ticket_register/models/ticket_model.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/ticket_register/widgets/counter_button.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';

class TicketRegister extends StatefulWidget {
  const TicketRegister({super.key});

  @override
  State<TicketRegister> createState() => _TicketRegisterState();
}

class _TicketRegisterState extends State<TicketRegister> {
  final controller = Get.put(TicketController());

  @override
  void initState() {
    super.initState();
    controller.reset();
  }

  Future<void> getCurrentDate(BuildContext context) async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(3000));

    if (date != null) {
      controller.dateRegister.value = DateFormat("dd-MM-yyyy").format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text("Đăng ký tham quan"),
        showBackArrow: true,
      ),
      body: Obx(
        () => Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Tiêu đề
              const Text(
                'Nhập thông tin của bạn',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: TColors.primary),
              ),
              const SizedBox(
                height: 30,
              ),
              // Thông tin đăng ký
              SizedBox(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    TextFormField(
                      enabled: false,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                      initialValue: controller.email.value,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Họ tên',
                      ),
                      onChanged: (val) {
                        controller.name.value = val;
                      },
                      initialValue: controller.name.value,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Số điện thoại',
                      ),
                      onChanged: (val) {
                        controller.phoneNumber.value =
                            val.replaceAll(RegExp(r'\s+'), '');
                        ;
                      },
                      initialValue: "0398668411",
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Row(
                            children: [
                              const Text("Ngày tham quan: "),
                              IconButton(
                                  onPressed: () {
                                    getCurrentDate(context);
                                  },
                                  icon: const Icon(Iconsax.calendar_1))
                            ],
                          )),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text("Số lượng: "),
                              CounterButton(
                                count: controller.counterQuantities.value,
                                onChange: (val) {
                                  val = val < 1 ? 1 : val;
                                  controller.counterQuantities.value = val;
                                },
                                loading: false,
                              )
                            ],
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [Text(controller.dateRegister.value)],
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 40),
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              TicketModel ticketModel = TicketModel(
                                  date: controller.dateRegister.value,
                                  name: controller.name.value,
                                  phoneNumber: controller.phoneNumber.value,
                                  quantities:
                                      controller.counterQuantities.value,
                                  userId: controller.userId.value);
                              controller.createTicket(ticketModel);
                            },
                            child: const Text("Đăng ký")))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
