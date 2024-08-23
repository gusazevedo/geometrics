import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final Key customPaintKey;

  const Circle({
    super.key,
    required this.customPaintKey,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      return CustomPaint(
        key: customPaintKey,
        size: Size(
          width,
          width,
        ),
        painter: ShapesPainter(
          size: Size(
            width,
            width,
          ),
        ),
      );
    });
  }
}

class ShapesPainter extends CustomPainter {
  final Size size;

  ShapesPainter({
    super.repaint,
    required this.size,
  });

  Path _getCirclePath() {
    return Path()..addOval(Rect.fromLTRB(0, 0, size.width, size.height));
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = Colors.yellow;

    final Path circlePath = _getCirclePath();
    canvas.drawPath(circlePath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  @override
  bool? hitTest(Offset position) {
    final Path circlePath = _getCirclePath();
    return circlePath.contains(position);
  }
}
