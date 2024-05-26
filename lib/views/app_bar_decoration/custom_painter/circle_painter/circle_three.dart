import 'package:do_it/views/app_bar_decoration/custom_painter/circle_painter/shape.dart';
import 'package:flutter/material.dart';

class CircleThree extends Shape {
  CircleThree(BuildContext context)
      : super(Theme.of(context).colorScheme.inverseSurface);

  @override
  void createPath(Size size) {
    path.moveTo(size.width * 0.2929488, size.height * -0.05046304);
    path.cubicTo(
        size.width * 0.1829928,
        size.height * 0.2864163,
        size.width * -0.1968633,
        size.height * 0.4822783,
        size.width * -0.5554825,
        size.height * 0.3870076);
    path.cubicTo(
        size.width * -0.9141024,
        size.height * 0.2917364,
        size.width * -1.115687,
        size.height * -0.05859022,
        size.width * -1.005729,
        size.height * -0.3954696);
    path.cubicTo(
        size.width * -0.8957711,
        size.height * -0.7323478,
        size.width * -0.5159163,
        size.height * -0.9282120,
        size.width * -0.1572964,
        size.height * -0.8329402);
    path.cubicTo(
        size.width * 0.2013235,
        size.height * -0.7376685,
        size.width * 0.4029054,
        size.height * -0.3873424,
        size.width * 0.2929488,
        size.height * -0.05046304);
    path.close();
  }
}
