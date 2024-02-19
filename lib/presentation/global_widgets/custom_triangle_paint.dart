import 'package:flutter/material.dart';

class DrawTriangle extends CustomPainter {
  DrawTriangle({this.colorCode});
  int? colorCode;
  @override
  void paint(Canvas canvas, Size size) {
    final paintGreen = Paint()..color = Color(colorCode!).withOpacity(0.15);

    final pathGreen = Path();
    pathGreen.moveTo(size.width, size.height);
    pathGreen.lineTo(0, size.height);
    pathGreen.lineTo(size.width, size.height / 100);
    pathGreen.close();

    canvas.drawPath(pathGreen, paintGreen);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
