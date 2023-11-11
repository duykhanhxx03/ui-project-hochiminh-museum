import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/texts/news_full_title.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/texts/stamp_text.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

class newsDescription extends StatelessWidget {
  const newsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NewsFullTitle(
                  fontSize: 20,
                  title:
                      "Đoàn Cơ sở Bảo tàng Hồ Chí Minh triển khai Chương trình “Đưa đoàn viên đến với các địa điểm văn hóa”"),
              Divider(
                thickness: 0.5,
              ),
              SizedBox(
                /// -- Time and view

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Iconsax.calendar_1,
                          size: 14,
                          color: Colors.grey,
                        ),
                        stampText(content: "08:29 20/10/2023"),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Iconsax.eye,
                          size: 10,
                          color: Colors.grey,
                        ),
                        stampText(content: "125"),
                      ],
                    ),
                    Row(
                      children: [
                        stampText(content: "Cỡ chữ - +"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: TSizes.spaceBtwElements,
              ),
              Text(
                  "Chiều 02/11, tại Hà Nội, Bảo tàng Hồ Chí Minh và Bộ Tư lệnh Cảnh vệ tổ chức Hội nghị giao ban công tác phối hợp. TS. Vũ Mạnh Hà, Giám đốc Bảo tàng Hồ Chí Minh và Đại tá Đỗ Xuân Tiệp, Phó Tư lệnh Bộ Tư lệnh Cảnh vệ đồng chủ trì hội nghị."),
            ],
          ),
        )),
      ),
    );
    ;
  }
}

class TSIzes {}
