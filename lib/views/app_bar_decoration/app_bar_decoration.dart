import 'package:do_it/views/app_bar_decoration/custom_painter/app_bar_decoration_custom_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarDecoration extends StatelessWidget {
  const AppBarDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(147.w, 158.h),
      painter: AppBarDecorationCustomPainter(context),
    );
  }
}
