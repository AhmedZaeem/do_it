import 'package:do_it/views/app_bar_decoration/custom_painter/circle_painter/shape.dart';
import 'package:flutter/material.dart';

class CircleOne extends Shape {
  CircleOne(BuildContext context)
      : super(Theme.of(context).colorScheme.secondary);

  @override
  void createPath(Size size) {
    path.moveTo(size.width * 0.3383753, size.height * 0.2086440);
    path.cubicTo(
        size.width * 0.3489819,
        size.height * 0.6258478,
        size.width * -0.002456325,
        size.height * 0.9715054,
        size.width * -0.4465837,
        size.height * 0.9806957);
    path.cubicTo(
        size.width * -0.8907108,
        size.height * 0.9898859,
        size.width * -1.259343,
        size.height * 0.6591250,
        size.width * -1.269952,
        size.height * 0.2419234);
    path.cubicTo(
        size.width * -1.280560,
        size.height * -0.1752793,
        size.width * -0.9291205,
        size.height * -0.5209391,
        size.width * -0.4849928,
        size.height * -0.5301288);
    path.cubicTo(
        size.width * -0.04086566,
        size.height * -0.5393190,
        size.width * 0.3277687,
        size.height * -0.2085592,
        size.width * 0.3383753,
        size.height * 0.2086440);
    path.close();
  }
}
