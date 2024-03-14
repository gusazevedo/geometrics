import 'package:flutter/material.dart';
// import 'package:geometric/src/shapes/circle.dart';
import 'package:geometric/src/shapes/line.dart';
import 'package:vibration/vibration.dart';
// import 'package:geometric/src/shapes/square.dart';

void main() {
  runApp(const GeometricApp());
}

class GeometricApp extends StatelessWidget {
  const GeometricApp({super.key});

  @override
  Widget build(BuildContext context) {
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
  const AppBody({super.key});

  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width - 40;
    double deviceHeight = MediaQuery.of(context).size.height - 120;

    return Center(
      child: Container(
        width: deviceWidth,
        height: deviceHeight,
        child: CustomPaint(
          foregroundPainter: Line(),
        )
      ),
    );
  }
}
