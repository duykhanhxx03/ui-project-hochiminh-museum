import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/home/museum_three_dimension.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/home/widgets/squared_button.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/img_lib/image_lib_main.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/video_lib/vid_lib_main.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/news/news_home.dart';
import 'package:ui_project_hochiminh_museum/repository/news_repository/news_repository.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

class CategoriesList extends StatelessWidget {
  CategoriesList({super.key});

  final controller = Get.put(NewsRepository());

  void _showBottomModal(BuildContext context, List<Widget> children) {
    showModalBottomSheet(
      scrollControlDisabledMaxHeightRatio: 0.5,
      useSafeArea: true,
      // isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(TSizes.spaceBtwSections),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 7 / 9,
              crossAxisSpacing: 4,
              mainAxisSpacing: 0,
            ),
            children: children,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.spaceBtwItems),
      child: GridView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 6 / 8,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        children: [
          SquaredButton(
            label: 'Tin tức - Sự kiện',
            backgroundColor: Colors.green,
            onTap: () {
              _showBottomModal(
                context,
                [
                  SquaredButton(
                    label: 'Hoạt động của bảo tàng Hồ Chí Minh',
                    backgroundColor: Colors.lightBlue,
                    onTap: () async {
                      var newsListCloud = await controller.getAllNews(
                          'TinTucSuKien', 'HDBaoTang');
                      // print(test[0].title);
                      Get.to(NewsScreen(
                        newsList: newsListCloud,
                      ));
                    },
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label:
                        'Hoạt động của hệ thống các bảo tàng, di tích lưu niệm về chủ tích Hồ Chí Minh',
                    backgroundColor: Colors.lightBlue,
                    onTap: () async {
                      var newsListCloud = await controller.getAllNews(
                          'TinTucSuKien', 'HDHeThongCacBT_DTLuuNiemHCM');
                      // print(test[0].title);
                      Get.to(NewsScreen(
                        newsList: newsListCloud,
                      ));
                    },
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Hoạt động ngành di sản văn hóa',
                    backgroundColor: Colors.lightBlue,
                    onTap: () async {
                      var newsListCloud = await controller.getAllNews(
                          'TinTucSuKien', 'HDNganhDSVH');
                      // print(newsListCloud[0].thumbnailUrl);
                      Get.to(NewsScreen(
                        newsList: newsListCloud,
                      ));
                    },
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Hoạt động bảo tàng trên thế giới',
                    backgroundColor: Colors.lightBlue,
                    onTap: () async {
                      var newsListCloud = await controller.getAllNews(
                          'TinTucSuKien', 'HDBaoTangTrenTG');
                      // print(test[0].title);
                      Get.to(NewsScreen(
                        newsList: newsListCloud,
                      ));
                    },
                    icon: Iconsax.receipt_search,
                  ),
                ],
              );
            },
            icon: Iconsax.book_1,
          ),
          SquaredButton(
            label: 'Trưng bày',
            backgroundColor: Colors.redAccent,
            onTap: () {
              _showBottomModal(context, [
                SquaredButton(
                  label: 'Trưng bày online',
                  backgroundColor: Colors.redAccent,
                  onTap: () {},
                  icon: Iconsax.book,
                ),
                SquaredButton(
                  label: 'Trưng bày thường xuyên',
                  backgroundColor: Colors.redAccent,
                  onTap: () {},
                  icon: Iconsax.book,
                ),
                SquaredButton(
                  label: 'Trưng bày chuyên đề',
                  backgroundColor: Colors.redAccent,
                  onTap: () {},
                  icon: Iconsax.book,
                ),
              ]);
            },
            icon: Iconsax.book,
          ),
          SquaredButton(
            label: 'Đăng ký tham quan',
            backgroundColor: Colors.redAccent,
            onTap: () {},
            icon: Iconsax.book,
          ),
          SquaredButton(
            label: 'Nghiên cứu',
            backgroundColor: Colors.lightBlue,
            onTap: () {
              _showBottomModal(
                context,
                [
                  SquaredButton(
                    label: 'Nghiên cứu về Hồ Chí Minh',
                    backgroundColor: Colors.lightBlue,
                    onTap: () async {
                      var newsListCloud = await controller.getAllNews(
                          'NghienCuu', 'NghienCuuHCM');
                      // print(test[0].title);
                      Get.to(NewsScreen(
                        newsList: newsListCloud,
                      ));
                    },
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Chuyện kể về Hồ Chí Minh',
                    backgroundColor: Colors.lightBlue,
                    onTap: () async {
                      var newsListCloud = await controller.getAllNews(
                          'NghienCuu', 'ChuyenKeHCM');
                      // print(test[0].title);
                      Get.to(NewsScreen(
                        newsList: newsListCloud,
                      ));
                    },
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Ấn phẩm về Hồ Chí Minh',
                    backgroundColor: Colors.lightBlue,
                    onTap: () async {
                      var newsListCloud =
                          await controller.getAllNews('NghienCuu', 'AnPhamHCM');
                      // print(test[0].title);
                      Get.to(NewsScreen(
                        newsList: newsListCloud,
                      ));
                    },
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Bộ sưu tập',
                    backgroundColor: Colors.lightBlue,
                    onTap: () async {
                      var newsListCloud =
                          await controller.getAllNews('NghienCuu', 'BoSuuTap');
                      // print(test[0].title);
                      Get.to(NewsScreen(
                        newsList: newsListCloud,
                      ));
                    },
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Hiện vật kể chuyện',
                    backgroundColor: Colors.lightBlue,
                    onTap: () async {
                      var newsListCloud = await controller.getAllNews(
                          'NghienCuu', 'HienVatKeChuyen');
                      // print(test[0].title);
                      Get.to(NewsScreen(
                        newsList: newsListCloud,
                      ));
                    },
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Hoạt động khoa học',
                    backgroundColor: Colors.lightBlue,
                    onTap: () async {
                      var newsListCloud =
                          await controller.getAllNews('NghienCuu', 'HDKhoaHoc');
                      // print(test[0].title);
                      Get.to(NewsScreen(
                        newsList: newsListCloud,
                      ));
                    },
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Công bố khoa học',
                    backgroundColor: Colors.lightBlue,
                    onTap: () async {
                      var newsListCloud =
                          await controller.getAllNews('NghienCuu', 'CongBoKH');
                      // print(test[0].title);
                      Get.to(NewsScreen(
                        newsList: newsListCloud,
                      ));
                    },
                    icon: Iconsax.receipt_search,
                  ),
                ],
              );
            },
            icon: Iconsax.receipt_search,
          ),
          SquaredButton(
            label: 'Bảo tàng 3D',
            backgroundColor: const Color.fromARGB(255, 206, 186, 9),
            onTap: () {
              Get.to(const MuseumThreeDimensionScreen());
            },
            icon: Iconsax.book,
          ),
          SquaredButton(
            label: 'Thư viện media',
            backgroundColor: Colors.redAccent,
            onTap: () {
              _showBottomModal(
                context,
                [
                  SquaredButton(
                    label: 'Thư viện ảnh',
                    backgroundColor: Colors.lightBlue,
                    onTap: () {
                      Get.to(const ImageLibScreen());
                    },
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Thư viện video',
                    backgroundColor: Colors.lightBlue,
                    onTap: () {
                      Get.to(const VideoLibScreen());
                    },
                    icon: Iconsax.receipt_search,
                  ),
                ],
              );
            },
            icon: Iconsax.book,
          ),
          SquaredButton(
            label: 'Giáo dục',
            backgroundColor: Colors.yellow,
            onTap: () {
              _showBottomModal(context, [
                SquaredButton(
                  label:
                      'Học tập và làm theo tấm gương đạo đức, phong cách Hồ Chí Minh',
                  backgroundColor: Colors.lightBlue,
                  onTap: () async {
                    var newsListCloud = await controller.getAllNews(
                        'GiaoDuc', 'HocTapTheoTamGuongHCM');
                    // print(test[0].title);
                    Get.to(NewsScreen(
                      newsList: newsListCloud,
                    ));
                  },
                  icon: Iconsax.receipt_search,
                ),
                SquaredButton(
                  label: 'Kể chuyện tấm gương đạo đức Hồ Chí Minh',
                  backgroundColor: Colors.lightBlue,
                  onTap: () async {
                    var newsListCloud =
                        await controller.getAllNews('GiaoDuc', 'KeChuyenHCM');
                    // print(test[0].title);
                    Get.to(NewsScreen(
                      newsList: newsListCloud,
                    ));
                  },
                  icon: Iconsax.receipt_search,
                ),
                SquaredButton(
                  label: 'Những tấm gương bình dị mà cao quý',
                  backgroundColor: Colors.lightBlue,
                  onTap: () async {
                    var newsListCloud =
                        await controller.getAllNews('GiaoDuc', 'NhungTamGuong');
                    // print(test[0].title);
                    Get.to(NewsScreen(
                      newsList: newsListCloud,
                    ));
                  },
                  icon: Iconsax.receipt_search,
                ),
                SquaredButton(
                  label: 'Phòng khám phá, trải nghiệm',
                  backgroundColor: Colors.lightBlue,
                  onTap: () async {
                    var newsListCloud =
                        await controller.getAllNews('GiaoDuc', 'PhongKhamPha');
                    // print(test[0].title);
                    Get.to(NewsScreen(
                      newsList: newsListCloud,
                    ));
                  },
                  icon: Iconsax.receipt_search,
                ),
                SquaredButton(
                  label: 'Bồi dưỡng nghiệp vụ thuyết minh',
                  backgroundColor: Colors.lightBlue,
                  onTap: () async {
                    var newsListCloud = await controller.getAllNews(
                        'GiaoDuc', 'BoiDuongNghiepVu');
                    // print(test[0].title);
                    Get.to(NewsScreen(
                      newsList: newsListCloud,
                    ));
                  },
                  icon: Iconsax.receipt_search,
                ),
                SquaredButton(
                  label: 'Các hoạt động giáo dục khác',
                  backgroundColor: Colors.lightBlue,
                  onTap: () async {
                    var newsListCloud = await controller.getAllNews(
                        'GiaoDuc', 'CacHoatDongKhac');
                    // print(test[0].title);
                    Get.to(NewsScreen(
                      newsList: newsListCloud,
                    ));
                  },
                  icon: Iconsax.receipt_search,
                ),
              ]);
            },
            icon: Iconsax.book,
          ),
          SquaredButton(
            label: 'Hỗ trợ tham quan',
            backgroundColor: Colors.redAccent,
            onTap: () {},
            icon: Iconsax.book,
          ),
        ],
      ),
    );
  }
}
