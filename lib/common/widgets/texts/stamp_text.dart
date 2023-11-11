import 'package:flutter/material.dart';

class stampText extends StatelessWidget {
  const stampText({
    super.key,
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Text(
      " " + content,
      style: const TextStyle(color: Colors.grey, fontSize: 12),
    );
  }
}
