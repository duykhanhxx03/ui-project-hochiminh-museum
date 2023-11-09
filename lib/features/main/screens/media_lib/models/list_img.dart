// ignore_for_file: public_member_api_docs, sort_constructors_first

class ListImage {
  String imgTitle;
  List<String> imgURL;
  DateTime dateSubmitted;

  ListImage({
    required this.imgTitle,
    required this.dateSubmitted,
    required this.imgURL,
  });
}
