import 'package:flutter/material.dart';

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
    return Text(
      title,
      maxLines: isNotice ? null : 2,
      style: isNotice
          ? const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
          : const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 12,
            ),
    );
  }
}
