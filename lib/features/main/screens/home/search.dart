import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/repository/news_repository/news_repository.dart';

import '../news/models/news_model.dart';
import '../news/news_description.dart';
import '../news/widgets/news_home/innotice_news.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SearchScreen> {
  late List<NewsModel> newsListData = [];
  final controller = Get.put(NewsRepository());

  void searchFromFirebase(String searchTerm) async {
    List<NewsModel> result = await controller.searchNews(searchTerm);

    setState(() {
      newsListData = result;
      // print("Độ dài: ${newsListData.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Post'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 12.0,
        ),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Tìm kiếm...',
              ),
              onChanged: (value) {
                searchFromFirebase(value);
              },
            ),
            Align(
              alignment: Alignment.centerLeft, // Align text to the left
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Số bài viết trùng khớp: ${newsListData.length}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: newsListData.length,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (_, index) => InnoticeNews(
                  date: newsListData[index].date,
                  isNetworkImage: true,
                  onPressed: () => Get.to(NewsDescriptionScreen(
                      newsContent: newsListData[index].newsContent)),
                  thumbnailUrl: newsListData[index].thumbnailUrl,
                  title: newsListData[index].title,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
