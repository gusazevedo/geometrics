import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:geometric/src/shapes/circle.dart';
import 'package:geometric/src/shapes/losangulo.dart';
import 'package:vibration/vibration.dart';

void main() {
  runApp(const GeometricApp());
}

class GeometricApp extends StatelessWidget {
  const GeometricApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text(
            'Geometric App',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: AppBody(),
      ),
    );
  }
}

class AppBody extends StatelessWidget {
  AppBody({super.key});

  final externalShapeKey = GlobalKey();
  final internalShapeKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Listener(
        onPointerMove: (PointerEvent details) {
          final externalBox =
              externalShapeKey.currentContext!.findRenderObject() as RenderBox;
          final internalBox =
              internalShapeKey.currentContext!.findRenderObject() as RenderBox;

          final boxHitTestResult = BoxHitTestResult();

          Offset externalLocalPosition =
              externalBox.globalToLocal(details.position);
          Offset internalLocalPosition =
              internalBox.globalToLocal(details.position);

          final externalResultHitTest = externalBox.hitTest(boxHitTestResult,
              position: externalLocalPosition);
          final internalResultHitTest = internalBox.hitTest(boxHitTestResult,
              position: internalLocalPosition);

          final ehPraVibrar = externalResultHitTest && !internalResultHitTest;

          if (ehPraVibrar) {
            Vibration.vibrate(duration: 1000);
          } else {
            Vibration.cancel();
          }
        },
        child: Container(
          color: Colors.transparent,
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Losan(
                  customPaintKey: externalShapeKey,
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Losan(
                    customPaintKey: internalShapeKey,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
