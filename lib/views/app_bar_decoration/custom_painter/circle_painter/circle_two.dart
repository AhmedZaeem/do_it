import 'package:do_it/views/app_bar_decoration/custom_painter/circle_painter/shape.dart';
import 'package:flutter/material.dart';

class CircleTwo extends Shape {
  CircleTwo(BuildContext context)
      : super(Theme.of(context).colorScheme.surface);

  @override
  void createPath(Size size) {
    path.moveTo(size.width * 0.9774518, size.height * -0.4130652);
    path.cubicTo(
        size.width * 0.9880602,
        size.height * 0.004137505,
        size.width * 0.6366205,
        size.height * 0.3497973,
        size.width * 0.1924940,
        size.height * 0.3589870);
    path.cubicTo(
        size.width * -0.2516331,
        size.height * 0.3681772,
        size.width * -0.6202651,
        size.height * 0.03741707,
        size.width * -0.6308735,
        size.height * -0.3797859);
    path.cubicTo(
        size.width * -0.6414819,
        size.height * -0.7969891,
        size.width * -0.2900428,
        size.height * -1.142647,
        size.width * 0.1540849,
        size.height * -1.151837);
    path.cubicTo(
        size.width * 0.5982120,
        size.height * -1.161027,
        size.width * 0.9668494,
        size.height * -0.8302663,
        size.width * 0.9774518,
        size.height * -0.4130652);
    path.close();
  }
}
