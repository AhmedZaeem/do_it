import 'package:do_it/constants.dart';
import 'package:do_it/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/${onBoardingScreens[_index].image}.png'),
        SizedBox(height: 70.h),
        Text(
          onBoardingScreens[_index].title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 8.h),
        Text(
          onBoardingScreens[_index].description,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: 130.h),
        CustomButton(
          btnText: onBoardingScreens[_index].btnText,
          onTap: () => setState(() => _index == 0 ? _index = 1 : _index = 0),
        ),
      ],
    );
  }
}
