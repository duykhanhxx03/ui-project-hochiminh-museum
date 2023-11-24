import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/features/admin/screens/create_news/text_editor_screen.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

class ChooseCategoryAndSubCategory extends StatefulWidget {
  const ChooseCategoryAndSubCategory({super.key});

  @override
  State<ChooseCategoryAndSubCategory> createState() =>
      _ChooseCategoryAndSubCategoryState();
}

class _ChooseCategoryAndSubCategoryState
    extends State<ChooseCategoryAndSubCategory> {
  final Map<String, List<String>> _newsCategoryWithSubCategories = {
    'Tin Tức - Sự kiện': [
      'Hoạt động của bảo tàng Hồ Chí Minh',
      'Hoạt động của hệ thống các bảo tàng, di tích lưu niệm về chủ tích Hồ Chí Minh',
      'Hoạt động ngành di sản văn hóa',
      'Hoạt động bảo tàng trên thế giới'
    ],
    'Nghiên cứu': [
      'Nghiên cứu về Hồ Chí Minh',
      'Chuyện kể về Hồ Chí Minh',
      'Ấn phẩm về Hồ Chí Minh',
      'Bộ sưu tập',
      'Hiện vật kể chuyện',
      'Hoạt động khoa học',
      'Công bố khoa học'
    ],
    'Giáo dục': [
      'Học tập và làm theo tấm gương đạo đức, phong cách Hồ Chí Minh',
      'Kể chuyện tấm gương đạo đức Hồ Chí Minh',
      'Những tấm gương bình dị mà cao quý',
      'Phòng khám phá, trải nghiệm',
      'Bồi dưỡng nghiệp vụ thuyết minh',
      'Các hoạt động giáo dục khác',
    ],
    // 'Trưng bày': [
    //   'Trưng bày online',
    //   'Trưng bày thường xuyên',
    //   'Trưng bày chuyên đề',
    // ],
    // 'Hỗ trợ tham quan': [
    //   'Giờ mở cửa',
    //   'Thông tin vé tham quan',
    //   'Nội quy tham quan'
    // ],
  };

  late String _selectedNewsCategory = _newsCategoryWithSubCategories.keys.first;
  late String _selectedNewsSubCategory =
      _newsCategoryWithSubCategories[_selectedNewsCategory]!.first;

  List<String> getAvailableSubCategories(selectedNewsCategory) {
    return _newsCategoryWithSubCategories[selectedNewsCategory] ?? [];
  }

  String getNewsCategoryDBName(String newsCategory) {
    switch (newsCategory) {
      case 'Tin Tức - Sự kiện':
        return 'TinTucSuKien';
      case 'Nghiên cứu':
        return 'NghienCuu';
      case 'Giáo dục':
        return 'GiaoDuc';
      // case 'Trưng bày':
      //   return 'TrungBay';
      // case 'Hỗ trợ tham quan':
      //   return 'HoTroThamQuan';
      default:
        return '';
    }
  }

  String getSubNewsCategoryDBName(String newsCategory, String subNewsCategory) {
    switch (newsCategory) {
      case 'Tin Tức - Sự kiện':
        switch (subNewsCategory) {
          case 'Hoạt động của bảo tàng Hồ Chí Minh':
            return 'HDBaoTang';
          case 'Hoạt động của hệ thống các bảo tàng, di tích lưu niệm về chủ tích Hồ Chí Minh':
            return 'HDHeThongCacBT_DTLuuNiemHCM';
          case 'Hoạt động ngành di sản văn hóa':
            return 'HDNganhDSVH';
          case 'Hoạt động bảo tàng trên thế giới':
            return 'HDBaoTangTrenTG';
        }
        break;
      case 'Nghiên cứu':
        switch (subNewsCategory) {
          case 'Nghiên cứu về Hồ Chí Minh':
            return 'NghienCuuHCM';
          case 'Chuyện kể về Hồ Chí Minh':
            return 'ChuyenKeHCM';
          case 'Ấn phẩm về Hồ Chí Minh':
            return 'AnPhamHCM';
          case 'Bộ sưu tập':
            return 'BoSuuTap';
          case 'Hiện vật kể chuyện':
            return 'HienVatKeChuyen';
          case 'Hoạt động khoa học':
            return 'HDKhoaHoc';
          case 'Công bố khoa học':
            return 'CongBoKH';
        }
        break;
      case 'Giáo dục':
        switch (subNewsCategory) {
          case 'Học tập và làm theo tấm gương đạo đức, phong cách Hồ Chí Minh':
            return 'HocTapTheoTamGuongHCM';
          case 'Kể chuyện tấm gương đạo đức Hồ Chí Minh':
            return 'KeChuyenHCM';
          case 'Những tấm gương bình dị mà cao quý':
            return 'NhungTamGuong';
          case 'Phòng khám phá, trải nghiệm':
            return 'PhongKhamPha';
          case 'Bồi dưỡng nghiệp vụ thuyết minh':
            return 'BoiDuongNghiepVu';
          case 'Các hoạt động giáo dục khác':
            return 'CacHoatDongKhac';
        }
        break;
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton<String>(
                items: _newsCategoryWithSubCategories.keys.map((category) {
                  return DropdownMenuItem<String>(
                    key: ValueKey(category),
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (category) {
                  setState(() {
                    _selectedNewsCategory = category!;
                  });
                  setState(() {
                    _selectedNewsSubCategory =
                        getAvailableSubCategories(category).first;
                  });
                },
                value: _selectedNewsCategory,
              ),
              DropdownButton<String>(
                items: getAvailableSubCategories(_selectedNewsCategory)
                    .map((subCategory) {
                  return DropdownMenuItem<String>(
                    key: ValueKey(subCategory),
                    value: subCategory,
                    child: Text(subCategory),
                  );
                }).toList(),
                onChanged: (subCategory) {
                  setState(() {
                    _selectedNewsSubCategory = subCategory!;
                  });
                },
                value: _selectedNewsSubCategory,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              TextButton(
                child: const Text('Đóng'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Tạo'),
                onPressed: () {
                  Get.to(TextEditorScreen(
                    newsCategory: getNewsCategoryDBName(_selectedNewsCategory),
                    subNewsCategory: getSubNewsCategoryDBName(
                        _selectedNewsCategory, _selectedNewsSubCategory),
                  ));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
