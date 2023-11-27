import 'package:flutter/material.dart';

class CommentConnector extends CustomPainter {
  final double startX;
  final double startY;
  final double endX;
  final double endY;
  final bool curved;

  CommentConnector({
    required this.startX,
    required this.startY,
    required this.endX,
    required this.endY,
    this.curved = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromARGB(255, 148, 5, 5)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    // print(size.width);
    // vẽ đường dọc
    // canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint)
    if (curved) {
      canvas.drawLine(
          Offset(startX, endY), Offset(size.width - 40, endY), paint);
    } else {
      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);
    }
    // vẽ đường ngang
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
