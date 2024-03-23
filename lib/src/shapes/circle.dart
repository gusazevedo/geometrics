import 'package:flutter/material.dart';
import 'package:touchable/touchable.dart';
import 'package:vibration/vibration.dart';

class Circle extends CustomPainter {
  final BuildContext context;

  Circle(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    final touchyCanvas = TouchyCanvas(context, canvas);
    final paint = Paint()
      ..strokeWidth = 20
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);

    touchyCanvas.drawCircle(center, size.width / 2, paint,
        onLongPressStart: (_) async {
      print('LONG PRESS STAAAAART');
      Vibration.vibrate(duration: 1000);
    }, onLongPressEnd: (_) {
      print('LONG PRESS EEEND');
    }, onLongPressMoveUpdate: (_) {
      print('LONG PRESS MOVE UPDATE');
    }, onTapDown: (_) {
      Vibration.vibrate(duration: 1000);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  @override
  bool? hitTest(Offset position) {
    // _path - is the same one we built in paint() method;
    // print(position);
    return super.hitTest(position);
  }
}
