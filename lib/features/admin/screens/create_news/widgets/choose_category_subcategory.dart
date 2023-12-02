import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/features/admin/screens/create_news/text_editor_screen.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/category_subcategory.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

class ChooseCategoryAndSubCategory extends StatefulWidget {
  const ChooseCategoryAndSubCategory({super.key});

  @override
  State<ChooseCategoryAndSubCategory> createState() =>
      _ChooseCategoryAndSubCategoryState();
}

class _ChooseCategoryAndSubCategoryState
    extends State<ChooseCategoryAndSubCategory> {
  late String _selectedNewsCategory =
      TCategorySubCategoryConstanst.newsCategoryWithSubCategories.keys.first;
  late String _selectedNewsSubCategory = TCategorySubCategoryConstanst
      .newsCategoryWithSubCategories[_selectedNewsCategory]!.first;

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
                items: TCategorySubCategoryConstanst
                    .newsCategoryWithSubCategories.keys
                    .map((category) {
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
                        TCategorySubCategoryConstanst.getAvailableSubCategories(
                                category)
                            .first;
                  });
                },
                value: _selectedNewsCategory,
              ),
              DropdownButton<String>(
                items: TCategorySubCategoryConstanst.getAvailableSubCategories(
                        _selectedNewsCategory)
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
                    newsCategory:
                        TCategorySubCategoryConstanst.getNewsCategoryDBName(
                            _selectedNewsCategory),
                    subNewsCategory:
                        TCategorySubCategoryConstanst.getSubNewsCategoryDBName(
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
