import 'package:flutter/material.dart';
import 'circle_painter/circle_one.dart';
import 'circle_painter/circle_three.dart';
import 'circle_painter/circle_two.dart';
import 'circle_painter/shape.dart';

class AppBarDecorationCustomPainter extends CustomPainter {
  AppBarDecorationCustomPainter(this.context)
      : shapes = [
          CircleOne(context),
          CircleTwo(context),
          CircleThree(context),
        ];
  final BuildContext context;
  final List<Shape> shapes;

  @override
  void paint(Canvas canvas, Size size) {
    for (var shape in shapes) {
      shape.drawPath(canvas, size);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
