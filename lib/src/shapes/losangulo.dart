import 'package:flutter/material.dart';

class Losan extends StatelessWidget {
  final Key customPaintKey;

  const Losan({
    super.key,
    required this.customPaintKey,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      return CustomPaint(
        key: customPaintKey,
        size: Size(width, (width * 1).toDouble()),
        painter: RPSCustomPainter(
          size: Size(width, (width * 1).toDouble()),
        ),
      );
    });
  }
}

class RPSCustomPainter extends CustomPainter {
  final Size size;

  RPSCustomPainter({super.repaint, required this.size});

  Path _drawGetPath() {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.5000000);
    path_0.lineTo(size.width * 0.5000000, 0);
    path_0.lineTo(size.width, size.height * 0.5000000);
    path_0.lineTo(size.width * 0.5000000, size.height);
    path_0.lineTo(0, size.height * 0.5000000);
    path_0.close();

    return path_0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.01
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    final path = _drawGetPath();

    canvas.drawPath(path, paintFill0);
    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path, paintStroke0);
  }

  @override
  bool? hitTest(Offset position) {
    final path = _drawGetPath();
    return path.contains(position);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
