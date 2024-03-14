import 'package:flutter/material.dart';

class Circle extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
    ..strokeWidth = 4
    ..style = PaintingStyle.stroke;
    
    final center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, size.width / 2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}