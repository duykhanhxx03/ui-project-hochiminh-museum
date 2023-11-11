import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

class NewsTitle extends StatelessWidget {
  const NewsTitle({
    required this.title,
    required this.isNotice,
    super.key,
  });

  final String title;
  final bool isNotice;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        maxLines: isNotice ? null : 2,
        style: isNotice
            ? TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
            : TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 12,
              ),
      ),
    );
  }
}
