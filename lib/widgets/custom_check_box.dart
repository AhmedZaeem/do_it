import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key, required this.isChecked, this.onTap});
  final bool isChecked;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36.h,
        width: 36.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Colors.black, width: 2.w),
        ),
        child: isChecked
            ? Icon(
                Icons.check_sharp,
                color: Colors.black,
                size: 20.sp,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
