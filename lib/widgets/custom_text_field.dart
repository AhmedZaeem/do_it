import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.maxLines = 1,
    this.horizontalPadding = 28,
    this.verticalPadding = 0,
  });
  final String hint;
  final int maxLines;
  final int horizontalPadding;
  final int verticalPadding;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          contentPadding: EdgeInsets.symmetric(
              horizontal: horizontalPadding.w, vertical: verticalPadding.h)),
      style: Theme.of(context).textTheme.displayMedium,
    );
  }
}
