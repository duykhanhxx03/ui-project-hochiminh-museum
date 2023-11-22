import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/news/widgets/news_description/full_news_description.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

class NewsDescriptionScreen extends StatelessWidget {
  const NewsDescriptionScreen({
    super.key,
    this.newsInfo,
  });

  // this.newsSelected = const News(
  //     title:
  //         "Đoàn Cơ sở Bảo tàng Hồ Chí Minh triển khai Chương trình “Đưa đoàn viên đến với các địa điểm văn hóa”",
  //     time: "08:00",
  //     date: "20/10/2023",
  //     views: 130,
  //     content:
  //         "Diễn ra theo hình thức trực tiếp kết hợp trực tuyến, Hội nghị đã thu hút sự tham dự đông đảo của các nhà ngoại giao lão thành, các đồng chí đại diện Lãnh đạo các Ban, Bộ, Ngành, địa phương, các Trưởng cơ quan đại diện Việt Nam ở nước ngoài, các học giả, nhà nghiên cứu, các tập đoàn, doanh nghiệp, các cơ quan thông tấn báo chí và đại diện các đơn vị trong Bộ Ngoại giao và Bộ Văn hóa, Thể thao và Du lịch. Diễn ra theo hình thức trực tiếp kết hợp trực tuyến, Hội nghị đã thu hút sự tham dự đông đảo của các nhà ngoại giao lão thành, các đồng chí đại diện Lãnh đạo các Ban, Bộ, Ngành, địa phương, các Trưởng cơ quan đại diện Việt Nam ở nước ngoài, các học giả, nhà nghiên cứu, các tập đoàn, doanh nghiệp, các cơ quan thông tấn báo chí và đại diện các đơn vị trong Bộ Ngoại giao và Bộ Văn hóa, Thể thao và Du lịch. Diễn ra theo hình thức trực tiếp kết hợp trực tuyến, Hội nghị đã thu hút sự tham dự đông đảo của các nhà ngoại giao lão thành, các đồng chí đại diện Lãnh đạo các Ban, Bộ, Ngành, địa phương, các Trưởng cơ quan đại diện Việt Nam ở nước ngoài, các học giả, nhà nghiên cứu, các tập đoàn, doanh nghiệp, các cơ quan thông tấn báo chí và đại diện các đơn vị trong Bộ Ngoại giao và Bộ Văn hóa, Thể thao và Du lịch. Diễn ra theo hình thức trực tiếp kết hợp trực tuyến, Hội nghị đã thu hút sự tham dự đông đảo của các nhà ngoại giao lão thành, các đồng chí đại diện Lãnh đạo các Ban, Bộ, Ngành, địa phương, các Trưởng cơ quan đại diện Việt Nam ở nước ngoài, các học giả, nhà nghiên cứu, các tập đoàn, doanh nghiệp, các cơ quan thông tấn báo chí và đại diện các đơn vị trong Bộ Ngoại giao và Bộ Văn hóa, Thể thao và Du lịch. Diễn ra theo hình thức trực tiếp kết hợp trực tuyến, Hội nghị đã thu hút sự tham dự đông đảo của các nhà ngoại giao lão thành, các đồng chí đại diện Lãnh đạo các Ban, Bộ, Ngành, địa phương, các Trưởng cơ quan đại diện Việt Nam ở nước ngoài, các học giả, nhà nghiên cứu, các tập đoàn, doanh nghiệp, các cơ quan thông tấn báo chí và đại diện các đơn vị trong Bộ Ngoại giao và Bộ Văn hóa, Thể thao và Du lịch. Diễn ra theo hình thức trực tiếp kết hợp trực tuyến, Hội nghị đã thu hút sự tham dự đông đảo của các nhà ngoại giao lão thành, các đồng chí đại diện Lãnh đạo các Ban, Bộ, Ngành, địa phương, các Trưởng cơ quan đại diện Việt Nam ở nước ngoài, các học giả, nhà nghiên cứu, các tập đoàn, doanh nghiệp, các cơ quan thông tấn báo chí và đại diện các đơn vị trong Bộ Ngoại giao và Bộ Văn hóa, Thể thao và Du lịch. Diễn ra theo hình thức trực tiếp kết hợp trực tuyến, Hội nghị đã thu hút sự tham dự đông đảo của các nhà ngoại giao lão thành, các đồng chí đại diện Lãnh đạo các Ban, Bộ, Ngành, địa phương, các Trưởng cơ quan đại diện Việt Nam ở nước ngoài, các học giả, nhà nghiên cứu, các tập đoàn, doanh nghiệp, các cơ quan thông tấn báo chí và đại diện các đơn vị trong Bộ Ngoại giao và Bộ Văn hóa, Thể thao và Du lịch. ",
  //     group: 1,
  //     recap:
  //         "Sáng 02/11, tại Hà Nội, Bảo tàng Hồ Chí Minh và Bộ Tư lệnh Cảnh vệ tổ chức Hội nghị giao ban công tác phối hợp. TS. Vũ Mạnh Hà, Giám đốc Bảo tàng Hồ Chí Minh và Đại tá Đỗ Xuân Tiệp, Phó Tư lệnh Bộ Tư lệnh Cảnh vệ đồng chủ trì hội nghị.",
  //     listImage: [
  //       ImageWithDescription(
  //           imageUrl: TImages.thumbnail1, description: "Hình ảnh buổi họp")
  //     ])

  // ignore: non_constant_identifier_names
  final List<dynamic>? newsInfo;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const TAppBar(
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FullNewsDescription(newsContent: newsInfo),
              const Divider(
                thickness: 0.7,
              ),
              const Text(
                "CÁC BÀI VIẾT KHÁC",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
