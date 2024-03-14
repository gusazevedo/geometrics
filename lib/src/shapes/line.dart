import 'package:flutter/material.dart';

class Line extends CustomPainter {
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
    ..strokeWidth = 4
    ..color = Colors.grey
    ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(size.width * 1 / 9, size.height * 1 / 2),
      Offset(size.width * 8 / 9, size.height * 1 / 2),
      paint,
    );
  }


  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}