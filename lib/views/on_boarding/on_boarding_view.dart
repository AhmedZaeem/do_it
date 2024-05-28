import 'package:do_it/constants.dart';
import 'package:do_it/view_model/on_boarding_model_view/on_boarding_model_view.dart';
import 'package:do_it/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../view_model/on_boarding_model_view/on_boarding_notifier.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final index = ref.watch(onBoardingProvider);
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 22.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                    'assets/images/${onBoardingScreens[index].image}.png'),
                SizedBox(height: 70.h),
                Text(
                  onBoardingScreens[index].title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 8.h),
                Text(
                  onBoardingScreens[index].description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 130.h),
                CustomButton(
                  btnText: onBoardingScreens[index].btnText,
                  onTap: () => OnBoardingModelView.onBoardingOnTap(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
