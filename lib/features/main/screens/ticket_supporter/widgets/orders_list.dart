import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/custom_shape/containers/rounded_container.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/ticket_supporter/models/ticket_model.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';
import 'package:ui_project_hochiminh_museum/utils/helpers/helper_functions.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key, required this.listTicket});

  final List<TicketModel> listTicket;
  static const int _price = 25000;

  orderByAscendingDate() {
    for (int i = 0; i < listTicket.length; i++) {
      for (int j = 0; j < listTicket.length; j++) {
        List<String> date1 = listTicket[i].date.split('-');
        List<String> date2 = listTicket[j].date.split('-');
        bool latest = false;

        if (int.parse(date1[2]) > int.parse(date2[2])) {
          latest = true;
        } else if (int.parse(date1[2]) == int.parse(date2[2])) {
          if (int.parse(date1[1]) > int.parse(date2[1])) {
            latest = true;
          } else if (int.parse(date1[1]) == int.parse(date2[1])) {
            if (int.parse(date1[0]) >= int.parse(date2[0])) {
              latest = true;
            }
          }
        }

        if (latest) {
          TicketModel tmp = listTicket[i];
          listTicket[i] = listTicket[j];
          listTicket[j] = tmp;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    orderByAscendingDate();
    return ListView.separated(
      shrinkWrap: true,
      itemCount: listTicket.length,
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwItems),
      itemBuilder: (_, index) => TRoundedContainer(
          showBorder: true,
          backgroundColor: dark ? TColors.dark : TColors.light,
          padding: const EdgeInsets.all(TSizes.md),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            /// -- Row 1
            Row(children: [
              // 1 - Icon
              const Icon(Iconsax.calendar),
              const SizedBox(width: TSizes.spaceBtwItems / 2),

              // 2 - Status & Date
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ngày tham quan',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: TColors.primary, fontWeightDelta: 1)),
                    Text(
                      listTicket[index].date,
                      style: Theme.of(context).textTheme.headlineSmall,
                    )
                  ],
                ),
              ),
            ]),

            const SizedBox(
              height: 10,
            ),
            //-- Row 2
            Row(children: [
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    // 1 - Icon
                    const Icon(Iconsax.tag),
                    const SizedBox(width: TSizes.spaceBtwItems / 2),

                    // 2 - Status & Date
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Số lượng',
                              style: Theme.of(context).textTheme.labelLarge),
                          Text(
                            listTicket[index].quantities.toString(),
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    // 1 - Icon
                    const Icon(Iconsax.money_3),
                    const SizedBox(width: TSizes.spaceBtwItems / 2),

                    // 2 - Status & Date
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tổng tiền',
                              style: Theme.of(context).textTheme.labelLarge),
                          Text(
                            "${(_price * listTicket[index].quantities)} đ",
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ])
          ])),
    );
  }
}
