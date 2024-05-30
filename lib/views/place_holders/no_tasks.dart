import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoTasks extends StatelessWidget {
  const NoTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 64.h),
        const Icon(
          Icons.article_outlined,
          size: 100,
          color: Colors.grey,
        ),
        SizedBox(height: 16.h),
        const Text(
          'No tasks yet',
          style: TextStyle(
            fontSize: 24,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
