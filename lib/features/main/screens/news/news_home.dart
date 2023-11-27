import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/news/models/news_model.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/news/news_description.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/news/widgets/news_home/innotice_news.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

// ignore: must_be_immutable
class NewsScreen extends StatelessWidget {
  NewsScreen({super.key, required this.newsList});

  List<NewsModel> newsList;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const TAppBar(
          title: Text('tieeu de bao'),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                if (newsList.isNotEmpty)
                  ListView.builder(
                    itemCount: newsList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) => InnoticeNews(
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
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
