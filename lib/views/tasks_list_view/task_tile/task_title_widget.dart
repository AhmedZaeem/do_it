import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskTitleWidget extends StatelessWidget {
  const TaskTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {},
      child: Container(
        alignment: Alignment.center,
        width: 270.w,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        height: 40.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              blurRadius: 6.r,
              blurStyle: BlurStyle.outer,
              color: Colors.black.withOpacity(.7),
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            Text(
              List.generate(200, (index) => 'aaaa').toString(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
