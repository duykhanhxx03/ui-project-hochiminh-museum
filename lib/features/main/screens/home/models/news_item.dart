class NewsItem {
  const NewsItem({
    required this.newsTitle,
    required this.author,
    required this.date,
    required this.url,
  });
  final String newsTitle;
  final String url;
  final String author;
  final String date;
}
