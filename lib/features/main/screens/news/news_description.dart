import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/news/widgets/news_description/full_news_description.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

class NewsDescriptionScreen extends StatelessWidget {
  const NewsDescriptionScreen({
    super.key,
    this.newsContent,
  });

  final List<dynamic>? newsContent;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const TAppBar(
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FullNewsDescription(newsContent: newsContent),
              const Divider(
                thickness: 0.7,
              ),
              const Text(
                "CÁC BÀI VIẾT KHÁC",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
