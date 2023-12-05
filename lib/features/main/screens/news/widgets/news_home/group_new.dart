import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/loading/custom_loading.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/news/models/news_model.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/news/news_description.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/news/news_home.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/news/widgets/news_home/innotice_news.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/news/widgets/news_home/notice_news.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/news/widgets/news_home/shimmer_innotice_news.dart';
import 'package:ui_project_hochiminh_museum/repository/news_repository/news_repository.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/category_subcategory.dart';

import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';
import 'package:ui_project_hochiminh_museum/utils/helpers/helper_functions.dart';

class GroupNews extends StatelessWidget {
  GroupNews({
    super.key,
    required this.category,
    required this.subCategory,
  });

  final controller = Get.put(NewsRepository());

  final String category;
  final String subCategory;

  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: TSizes.spaceBtwSections),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '|${TCategorySubCategoryConstanst.getSubNewsCategoryName(
                    TCategorySubCategoryConstanst.getNewsCategoryName(category),
                    subCategory,
                  )}',
                  style: TextStyle(
                    color: !isDark ? TColors.primary : TColors.light,
                    fontWeight: FontWeight.bold,
                    fontSize: TSizes.fontSizeLg,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            FutureBuilder(
              future:
                  controller.getAllNews(category, subCategory, isLimit: true),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    List<NewsModel> newsList = snapshot.data as List<NewsModel>;
                    if (newsList.isNotEmpty) {
                      return ListView.builder(
                        itemCount: newsList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          if (newsList.length > 1 && index == 0) {
                            return NoticeNews(
                              isNetworkImage: true,
                              thumbnailUrl: newsList[index].thumbnailUrl,
                              title: newsList[index].title,
                              date: newsList[index].date,
                              view: 130,
                              description: newsList[index].description,
                              isNotice: true,
                              onPressed: () {
                                Get.to(
                                  NewsDescriptionScreen(
                                      newsContent: newsList[index].newsContent),
                                );
                              },
                            );
                          } else {
                            return InnoticeNews(
                              date: newsList[index].date,
                              isNetworkImage: true,
                              onPressed: () {
                                Get.to(
                                  NewsDescriptionScreen(
                                      newsContent: newsList[index].newsContent),
                                );
                              },
                              thumbnailUrl: newsList[index].thumbnailUrl,
                              title: newsList[index].title,
                            );
                          }
                        },
                      );
                    }
                  }
                }
                return ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: const [
                    ShimmerInnoticeNews(),
                    ShimmerInnoticeNews(),
                    ShimmerInnoticeNews(),
                  ],
                );
              },
            ),
            TextButton(
              onPressed: () {
                Get.to(
                    NewsScreen(category: category, subCategory: subCategory));
              },
              child: Text(
                'Xem thêm',
                style: TextStyle(
                  color: !isDark ? TColors.primary : TColors.light,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
