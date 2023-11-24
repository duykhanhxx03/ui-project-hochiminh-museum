import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
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
