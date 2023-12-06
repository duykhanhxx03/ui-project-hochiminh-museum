import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/features/admin/screens/create_news/text_editor_screen.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/category_subcategory.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';
import 'package:ui_project_hochiminh_museum/utils/helpers/helper_functions.dart';

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
                itemHeight: 60,
                items: TCategorySubCategoryConstanst.getAvailableSubCategories(
                        _selectedNewsCategory)
                    .map((subCategory) {
                  return DropdownMenuItem<String>(
                    alignment: Alignment.centerLeft,
                    key: ValueKey(subCategory),
                    value: subCategory,
                    child: SizedBox(
                      width: THelperFunctions.screenWidth() * 3 / 4,
                      child: Text(
                        subCategory,
                        softWrap: true,
                      ),
                    ),
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
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  foregroundColor: TColors.primary,
                ),
                child: const Text('Đóng'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: TColors.primary,
                  foregroundColor: TColors.light,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Get.to(
                    TextEditorScreen(
                      newsCategory:
                          TCategorySubCategoryConstanst.getNewsCategoryDBName(
                              _selectedNewsCategory),
                      subNewsCategory: TCategorySubCategoryConstanst
                          .getSubNewsCategoryDBName(
                              _selectedNewsCategory, _selectedNewsSubCategory),
                    ),
                    transition: Transition.cupertino,
                  );
                },
                child: const Text('Tạo'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
