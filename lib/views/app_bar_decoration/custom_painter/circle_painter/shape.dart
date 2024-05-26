import 'package:flutter/material.dart';

abstract class Shape {
  Path path = Path();
  Paint paint = Paint()..style = PaintingStyle.fill;

  Shape(Color color) {
    paint.color = color;
  }

  void createPath(Size size);
  void drawPath(Canvas canvas, Size size) {
    createPath(size);
    canvas.drawPath(path, paint);
  }
}
