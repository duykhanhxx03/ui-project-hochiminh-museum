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
            backgroundColor: Colors.green,
            onTap: () {
              _showBottomModal(
                context,
                [
                  SquaredButton(
                    label: 'Hoạt động của bảo tàng Hồ Chí Minh',
                    backgroundColor: Colors.green,
                    onTap: () async {
                      Navigator.pop(context);
                      await Get.to(
                        () => NewsScreen(
                          category: 'TinTucSuKien',
                          subCategory: 'HDBaoTang',
                        ),
                      );
                    },
                    icon: Iconsax.activity,
                  ),
                  SquaredButton(
                    label:
                        'Hoạt động của hệ thống các bảo tàng, di tích lưu niệm về chủ tích Hồ Chí Minh',
                    backgroundColor: Colors.red,
                    onTap: () async {
                      Navigator.pop(context);
                      await Get.to(
                        () => NewsScreen(
                          category: 'TinTucSuKien',
                          subCategory: 'HDHeThongCacBT_DTLuuNiemHCM',
                        ),
                      );
                    },
                    icon: Iconsax.activity,
                  ),
                  SquaredButton(
                    label: 'Hoạt động ngành di sản văn hóa',
                    backgroundColor: Colors.purple,
                    onTap: () async {
                      Navigator.pop(context);
                      await Get.to(
                        () => NewsScreen(
                          category: 'TinTucSuKien',
                          subCategory: 'HDNganhDSVH',
                        ),
                      );
                    },
                    icon: Iconsax.activity,
                  ),
                  SquaredButton(
                    label: 'Hoạt động bảo tàng trên thế giới',
                    backgroundColor: Colors.lightBlue,
                    onTap: () async {
                      Navigator.pop(context);
                      await Get.to(
                        () => NewsScreen(
                          category: 'TinTucSuKien',
                          subCategory: 'HDBaoTangTrenTG',
                        ),
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
            onTap: () {
              _showBottomModal(
                context,
                [
                  SquaredButton(
                    label: 'Đăng ký tham quan',
                    backgroundColor: Colors.lightBlue,
                    onTap: () => Get.to(const TicketRegisterScreen()),
                    icon: Iconsax.ticket,
                  ),
                  SquaredButton(
                    label: 'Lịch sử mua vé',
                    backgroundColor: Colors.lightBlue,
                    onTap: () => Get.to(TicketOrderScreen()),
                    icon: Iconsax.refresh,
                  ),
                ],
              );
            },
            icon: Iconsax.document_upload,
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
                      Navigator.pop(context);
                      await Get.to(
                        () => NewsScreen(
                          category: 'NghienCuu',
                          subCategory: 'NghienCuuHCM',
                        ),
                      );
                    },
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Chuyện kể về Hồ Chí Minh',
                    backgroundColor: Colors.lightBlue,
                    onTap: () async {
                      Navigator.pop(context);
                      await Get.to(
                        () => NewsScreen(
                          category: 'NghienCuu',
                          subCategory: 'ChuyenKeHCM',
                        ),
                      );
                    },
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Ấn phẩm về Hồ Chí Minh',
                    backgroundColor: Colors.lightBlue,
                    onTap: () async {
                      Navigator.pop(context);
                      await Get.to(
                        () => NewsScreen(
                          category: 'NghienCuu',
                          subCategory: 'AnPhamHCM',
                        ),
                      );
                    },
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Bộ sưu tập',
                    backgroundColor: Colors.lightBlue,
                    onTap: () async {
                      Navigator.pop(context);
                      await Get.to(
                        () => NewsScreen(
                          category: 'NghienCuu',
                          subCategory: 'BoSuuTap',
                        ),
                      );
                    },
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Hiện vật kể chuyện',
                    backgroundColor: Colors.lightBlue,
                    onTap: () async {
                      Navigator.pop(context);
                      await Get.to(
                        () => NewsScreen(
                          category: 'NghienCuu',
                          subCategory: 'HienVatKeChuyen',
                        ),
                      );
                    },
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Hoạt động khoa học',
                    backgroundColor: Colors.lightBlue,
                    onTap: () async {
                      Navigator.pop(context);
                      await Get.to(
                        () => NewsScreen(
                          category: 'NghienCuu',
                          subCategory: 'HDKhoaHoc',
                        ),
                      );
                    },
                    icon: Iconsax.receipt_search,
                  ),
                  SquaredButton(
                    label: 'Công bố khoa học',
                    backgroundColor: Colors.lightBlue,
                    onTap: () async {
                      Navigator.pop(context);
                      await Get.to(
                        () => NewsScreen(
                          category: 'NghienCuu',
                          subCategory: 'CongBoKH',
                        ),
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
            backgroundColor: const Color.fromARGB(255, 206, 186, 9),
            onTap: () {
              Get.to(const MuseumThreeDimensionScreen());
            },
            icon: MdiIcons.video3D,
            iconSize: 35,
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
                      Navigator.pop(context);
                      Get.to(const ImageLibScreen());
                    },
                    icon: Iconsax.gallery,
                  ),
                  SquaredButton(
                    label: 'Thư viện video',
                    backgroundColor: Colors.lightBlue,
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(const VideoLibScreen());
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
            backgroundColor: Colors.yellow,
            onTap: () {
              _showBottomModal(context, [
                SquaredButton(
                  label:
                      'Học tập và làm theo tấm gương đạo đức, phong cách Hồ Chí Minh',
                  backgroundColor: Colors.lightBlue,
                  onTap: () async {
                    Navigator.pop(context);
                    await Get.to(
                      () => NewsScreen(
                        category: 'GiaoDuc',
                        subCategory: 'HocTapTheoTamGuongHCM',
                      ),
                    );
                  },
                  icon: Iconsax.receipt_search,
                ),
                SquaredButton(
                  label: 'Kể chuyện tấm gương đạo đức Hồ Chí Minh',
                  backgroundColor: Colors.lightBlue,
                  onTap: () async {
                    Navigator.pop(context);
                    await Get.to(
                      () => NewsScreen(
                        category: 'GiaoDuc',
                        subCategory: 'KeChuyenHCM',
                      ),
                    );
                  },
                  icon: Iconsax.receipt_search,
                ),
                SquaredButton(
                  label: 'Những tấm gương bình dị mà cao quý',
                  backgroundColor: Colors.lightBlue,
                  onTap: () async {
                    Navigator.pop(context);
                    await Get.to(
                      () => NewsScreen(
                        category: 'GiaoDuc',
                        subCategory: 'NhungTamGuong',
                      ),
                    );
                  },
                  icon: Iconsax.receipt_search,
                ),
                SquaredButton(
                  label: 'Phòng khám phá, trải nghiệm',
                  backgroundColor: Colors.lightBlue,
                  onTap: () async {
                    Navigator.pop(context);
                    await Get.to(
                      () => NewsScreen(
                        category: 'GiaoDuc',
                        subCategory: 'PhongKhamPha',
                      ),
                    );
                  },
                  icon: Iconsax.receipt_search,
                ),
                SquaredButton(
                  label: 'Bồi dưỡng nghiệp vụ thuyết minh',
                  backgroundColor: Colors.lightBlue,
                  onTap: () async {
                    Navigator.pop(context);
                    await Get.to(
                      () => NewsScreen(
                        category: 'GiaoDuc',
                        subCategory: 'BoiDuongNghiepVu',
                      ),
                    );
                  },
                  icon: Iconsax.receipt_search,
                ),
                SquaredButton(
                  label: 'Các hoạt động giáo dục khác',
                  backgroundColor: Colors.lightBlue,
                  onTap: () async {
                    Navigator.pop(context);
                    await Get.to(
                      () => NewsScreen(
                        category: 'GiaoDuc',
                        subCategory: 'CacHoatDongKhac',
                      ),
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
            backgroundColor: Colors.redAccent,
            onTap: () {},
            icon: Iconsax.book,
          ),
        ],
      ),
    );
  }
}
