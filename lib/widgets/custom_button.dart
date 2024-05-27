import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.btnText, this.onTap, this.width = 160});
  final Function()? onTap;
  final String btnText;
  final int width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: width.w,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Text(
          btnText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
