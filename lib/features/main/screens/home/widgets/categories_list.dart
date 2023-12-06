import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/3dmuseum/museum_three_dimension.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/home/widgets/squared_button.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/img_lib/image_lib_main.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/video_lib/vid_lib_main.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/news/news_home.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/ticket_supporter/ticket_order_screen.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/ticket_supporter/ticket_register_screen.dart';
import 'package:ui_project_hochiminh_museum/repository/news_repository/news_repository.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CategoriesList extends StatelessWidget {
  CategoriesList({super.key});

  final controller = Get.put(NewsRepository());

  void _showBottomModal(BuildContext context, List<Widget> children) {
    showModalBottomSheet(
      //scrollControlDisabledMaxHeightRatio: 0.5,
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
            backgroundColor: const Color.fromARGB(255, 117, 14, 33),
            onTap: () {
              _showBottomModal(
                context,
                [
                  SquaredButton(
                    label: 'Hoạt động của bảo tàng Hồ Chí Minh',
                    backgroundColor: const Color.fromARGB(255, 117, 14, 33),
                    onTap: () async {
                      Navigator.pop(context);
                      await Get.to(
                        () => NewsScreen(
                          category: 'TinTucSuKien',
                          subCategory: 'HDBaoTang',
                        ),
                        transition: Transition.cupertino,
                      );
                    },
                    icon: Iconsax.activity,
                  ),
                  SquaredButton(
                    label:
                        'Hoạt động của hệ thống các bảo tàng, di tích lưu niệm về chủ tích Hồ Chí Minh',
                    backgroundColor: const Color.fromARGB(255, 117, 14, 33),
                    onTap: () async {
                      Navigator.pop(context);
                      await Get.to(
                        () => NewsScreen(
                          category: 'TinTucSuKien',
                          subCategory: 'HDHeThongCacBT_DTLuuNiemHCM',
                        ),
                        transition: Transition.cupertino,
                      );
                    },
                    icon: Iconsax.activity,
                  ),
                  SquaredButton(
                    label: 'Hoạt động ngành di sản văn hóa',
                    backgroundColor: const Color.fromARGB(255, 117, 14, 33),
                    onTap: () async {
                      Navigator.pop(context);
                      await Get.to(
                        () => NewsScreen(
                          category: 'TinTucSuKien',
                          subCategory: 'HDNganhDSVH',
                        ),
                        transition: Transition.cupertino,
                      );
                    },
                    icon: Iconsax.activity,
                  ),
                  SquaredButton(
                    label: 'Hoạt động bảo tàng trên thế giới',
                    backgroundColor: const Color.fromARGB(255, 117, 14, 33),
                    onTap: () async {
                      Navigator.pop(context);
                      await Get.to(
                        () => NewsScreen(
                          category: 'TinTucSuKien',
                          subCategory: 'HDBaoTangTrenTG',
                        ),
                        transition: Transition.cupertino,
                      );
                    },
                    icon: Iconsax.activity,
                  ),
                ],
              );
            },
            icon: Iconsax.book_1,
          ),
          SquaredButton(
            label: 'Trưng bày',
            backgroundColor: const Color.fromARGB(255, 101, 114, 43),
            onTap: () {
              _showBottomModal(context, [
                SquaredButton(
                  label: 'Trưng bày online',
                  backgroundColor: const Color.fromARGB(255, 101, 114, 43),
                  onTap: () {},
                  icon: Iconsax.book,
                ),
                SquaredButton(
                  label: 'Trưng bày thường xuyên',
                  backgroundColor: const Color.fromARGB(255, 101, 114, 43),
                  onTap: () {},
                  icon: Iconsax.book,
                ),
                SquaredButton(
                  label: 'Trưng bày chuyên đề',
                  backgroundColor: const Color.fromARGB(255, 101, 114, 43),
                  onTap: () {},
                  icon: Iconsax.book,
                ),
              ]);
            },
            icon: Iconsax.book,
          ),
          SquaredButton(
              label: 'Đăng ký tham quan',
              backgroundColor: const Color.fromARGB(255, 117, 60, 60),
              onTap: () {
                _showBottomModal(
                  context,
                  [
                    SquaredButton(
                      label: 'Đăng ký tham quan',
                      backgroundColor: const Color.fromARGB(255, 117, 60, 60),
                      onTap: () => Get.to(
                        const TicketRegisterScreen(),
                        transition: Transition.cupertino,
                      ),
                      icon: Iconsax.ticket,
                    ),
                    SquaredButton(
                      label: 'Lịch sử mua vé',
                      backgroundColor: const Color.fromARGB(255, 117, 60, 60),
                      onTap: () => Get.to(
                        TicketOrderScreen(),
                        transition: Transition.cupertino,
                      ),
                      icon: Iconsax.refresh,
                    ),
                  ],
                );
              },
              icon: Iconsax.document_upload),
          SquaredButton(
            label: 'Nghiên cứu',
            backgroundColor: const Color.fromARGB(255, 8, 98, 139),
            onTap: () {
              _showBottomModal(
                context,
                [
                  SquaredButton(
                    label: 'Nghiên cứu về Hồ Chí Minh',
                    backgroundColor: const Color.fromARGB(255, 8, 98, 139),
                    onTap: () async {
                      Navigator.pop(context);
                      await Get.to(
                        () => NewsScreen(
                          category: 'NghienCuu',
                          subCategory: 'NghienCuuHCM',
                        ),
                        transition: Transition.cupertino,
                      );
                    },
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Chuyện kể về Hồ Chí Minh',
                    backgroundColor: const Color.fromARGB(255, 8, 98, 139),
                    onTap: () async {
                      Navigator.pop(context);
                      await Get.to(
                        () => NewsScreen(
                          category: 'NghienCuu',
                          subCategory: 'ChuyenKeHCM',
                        ),
                        transition: Transition.cupertino,
                      );
                    },
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Ấn phẩm về Hồ Chí Minh',
                    backgroundColor: const Color.fromARGB(255, 8, 98, 139),
                    onTap: () async {
                      Navigator.pop(context);
                      await Get.to(
                        () => NewsScreen(
                          category: 'NghienCuu',
                          subCategory: 'AnPhamHCM',
                        ),
                        transition: Transition.cupertino,
                      );
                    },
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Bộ sưu tập',
                    backgroundColor: const Color.fromARGB(255, 8, 98, 139),
                    onTap: () async {
                      Navigator.pop(context);
                      await Get.to(
                        () => NewsScreen(
                          category: 'NghienCuu',
                          subCategory: 'BoSuuTap',
                        ),
                        transition: Transition.cupertino,
                      );
                    },
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Hiện vật kể chuyện',
                    backgroundColor: const Color.fromARGB(255, 8, 98, 139),
                    onTap: () async {
                      Navigator.pop(context);
                      await Get.to(
                        () => NewsScreen(
                          category: 'NghienCuu',
                          subCategory: 'HienVatKeChuyen',
                        ),
                        transition: Transition.cupertino,
                      );
                    },
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Hoạt động khoa học',
                    backgroundColor: const Color.fromARGB(255, 8, 98, 139),
                    onTap: () async {
                      Navigator.pop(context);
                      await Get.to(
                        () => NewsScreen(
                          category: 'NghienCuu',
                          subCategory: 'HDKhoaHoc',
                        ),
                        transition: Transition.cupertino,
                      );
                    },
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Công bố khoa học',
                    backgroundColor: const Color.fromARGB(255, 8, 98, 139),
                    onTap: () async {
                      Navigator.pop(context);
                      await Get.to(
                        () => NewsScreen(
                          category: 'NghienCuu',
                          subCategory: 'CongBoKH',
                        ),
                        transition: Transition.cupertino,
                      );
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
            backgroundColor: const Color.fromARGB(255, 134, 123, 24),
            onTap: () {
              Get.to(
                () => const MuseumThreeDimensionScreen(),
                transition: Transition.cupertino,
              );
            },
            icon: MdiIcons.video3D,
            iconSize: 35,
          ),
          SquaredButton(
            label: 'Thư viện media',
            backgroundColor: const Color.fromARGB(255, 78, 60, 148),
            onTap: () {
              _showBottomModal(
                context,
                [
                  SquaredButton(
                    label: 'Thư viện ảnh',
                    backgroundColor: const Color.fromARGB(255, 78, 60, 148),
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(
                        () => const ImageLibScreen(),
                        transition: Transition.cupertino,
                      );
                    },
                    icon: Iconsax.gallery,
                  ),
                  SquaredButton(
                    label: 'Thư viện video',
                    backgroundColor: const Color.fromARGB(255, 78, 60, 148),
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(
                        () => const VideoLibScreen(),
                        transition: Transition.cupertino,
                      );
                    },
                    icon: Iconsax.video_play,
                  ),
                ],
              );
            },
            icon: Iconsax.gallery,
          ),
          SquaredButton(
            label: 'Giáo dục',
            backgroundColor: const Color.fromARGB(255, 170, 74, 10),
            onTap: () {
              _showBottomModal(context, [
                SquaredButton(
                  label:
                      'Học tập và làm theo tấm gương đạo đức, phong cách Hồ Chí Minh',
                  backgroundColor: const Color.fromARGB(255, 170, 74, 10),
                  onTap: () async {
                    Navigator.pop(context);
                    await Get.to(
                      () => NewsScreen(
                        category: 'GiaoDuc',
                        subCategory: 'HocTapTheoTamGuongHCM',
                      ),
                      transition: Transition.cupertino,
                    );
                  },
                  icon: Iconsax.receipt_search,
                ),
                SquaredButton(
                  label: 'Kể chuyện tấm gương đạo đức Hồ Chí Minh',
                  backgroundColor: const Color.fromARGB(255, 170, 74, 10),
                  onTap: () async {
                    Navigator.pop(context);
                    await Get.to(
                      () => NewsScreen(
                        category: 'GiaoDuc',
                        subCategory: 'KeChuyenHCM',
                      ),
                      transition: Transition.cupertino,
                    );
                  },
                  icon: Iconsax.receipt_search,
                ),
                SquaredButton(
                  label: 'Những tấm gương bình dị mà cao quý',
                  backgroundColor: const Color.fromARGB(255, 170, 74, 10),
                  onTap: () async {
                    Navigator.pop(context);
                    await Get.to(
                      () => NewsScreen(
                        category: 'GiaoDuc',
                        subCategory: 'NhungTamGuong',
                      ),
                      transition: Transition.cupertino,
                    );
                  },
                  icon: Iconsax.receipt_search,
                ),
                SquaredButton(
                  label: 'Phòng khám phá, trải nghiệm',
                  backgroundColor: const Color.fromARGB(255, 170, 74, 10),
                  onTap: () async {
                    Navigator.pop(context);
                    await Get.to(
                      () => NewsScreen(
                        category: 'GiaoDuc',
                        subCategory: 'PhongKhamPha',
                      ),
                      transition: Transition.cupertino,
                    );
                  },
                  icon: Iconsax.receipt_search,
                ),
                SquaredButton(
                  label: 'Bồi dưỡng nghiệp vụ thuyết minh',
                  backgroundColor: const Color.fromARGB(255, 170, 74, 10),
                  onTap: () async {
                    Navigator.pop(context);
                    await Get.to(
                      () => NewsScreen(
                        category: 'GiaoDuc',
                        subCategory: 'BoiDuongNghiepVu',
                      ),
                      transition: Transition.cupertino,
                    );
                  },
                  icon: Iconsax.receipt_search,
                ),
                SquaredButton(
                  label: 'Các hoạt động giáo dục khác',
                  backgroundColor: const Color.fromARGB(255, 170, 74, 10),
                  onTap: () async {
                    Navigator.pop(context);
                    await Get.to(
                      () => NewsScreen(
                        category: 'GiaoDuc',
                        subCategory: 'CacHoatDongKhac',
                      ),
                      transition: Transition.cupertino,
                    );
                  },
                  icon: Iconsax.receipt_search,
                ),
              ]);
            },
            icon: Iconsax.briefcase,
          ),
          SquaredButton(
            label: 'Hỗ trợ tham quan',
            backgroundColor: const Color.fromARGB(255, 75, 58, 10),
            onTap: () {},
            icon: Iconsax.book,
          ),
        ],
      ),
    );
  }
}
