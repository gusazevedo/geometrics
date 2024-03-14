import 'package:flutter/material.dart';

class Square extends CustomPainter {
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
    ..strokeWidth = 4
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke;

    final shape = Rect.fromPoints(
      Offset(size.width * 1 / 9, size.height * 1 / 4),
      Offset(size.width * 8 / 9, size.height * 3 / 4)
    );
    
    canvas.drawRect(shape, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}