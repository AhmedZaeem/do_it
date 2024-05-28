import 'package:do_it/constants.dart';
import 'package:do_it/controllers/shared_preferences_controller.dart';
import 'package:do_it/view_model/on_boarding_model_view/on_boarding_notifier.dart';
import 'package:do_it/views/home_view/body_view.dart';
import 'package:flutter/material.dart';

import '../../views/home_view/home_view.dart';

class OnBoardingModelView {
  static onBoardingOnTap(context) async {
    final index = context.read(onBoardingProvider);
    if (index == 1) {
      await SharedPreferencesController()
          .saveData(SharedPreferencesKeys.onBoarding, true);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const BodyView()));
    } else {
      context.read(onBoardingProvider.notifier).changeIndex();
    }
  }
}
