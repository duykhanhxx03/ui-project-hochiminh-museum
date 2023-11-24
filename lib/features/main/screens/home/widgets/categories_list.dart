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
                      var test = await controller.getAllNews(
                          'TinTucSuKien', 'HDBaoTang');
                      // print(test[0].title);
                      Get.to(NewsScreen(
                        newsList: test,
                      ));
                    },
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label:
                        'Hoạt động của hệ thống các bảo tàng, di tích lưu niệm về chủ tích Hồ Chí Minh',
                    backgroundColor: Colors.lightBlue,
                    onTap: () {},
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Hoạt động ngành di sản văn hóa',
                    backgroundColor: Colors.lightBlue,
                    onTap: () {},
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Hoạt động bảo tàng trên thế giới',
                    backgroundColor: Colors.lightBlue,
                    onTap: () {},
                    icon: Iconsax.receipt_search,
                  ),
                ],
              );
            },
            icon: Iconsax.book_1,
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
                    onTap: () {},
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Chuyện kể về Hồ Chí Minh',
                    backgroundColor: Colors.lightBlue,
                    onTap: () {},
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Ấn phẩm về Hồ Chí Minh',
                    backgroundColor: Colors.lightBlue,
                    onTap: () {},
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Bộ sưu tập',
                    backgroundColor: Colors.lightBlue,
                    onTap: () {},
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Hiện vật kể chuyện',
                    backgroundColor: Colors.lightBlue,
                    onTap: () {},
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Hoạt động khoa học',
                    backgroundColor: Colors.lightBlue,
                    onTap: () {},
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Công bố khoa học',
                    backgroundColor: Colors.lightBlue,
                    onTap: () {},
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
            onTap: () {},
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
