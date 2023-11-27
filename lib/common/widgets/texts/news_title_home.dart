import 'package:flutter/material.dart';

class NewsTitle extends StatelessWidget {
  const NewsTitle({
    required this.title,
    required this.isNotice,
    this.maxLines = 2,
    super.key,
  });

  final String title;
  final bool isNotice;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: isNotice ? null : maxLines,
      style: isNotice
          ? const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
          : const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 12,
            ),
    );
  }
}
