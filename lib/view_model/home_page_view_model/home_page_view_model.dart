import 'package:do_it/constants.dart';
import 'package:do_it/controllers/shared_preferences_controller.dart';
import 'package:do_it/views/home_view/body_view.dart';
import 'package:do_it/views/on_boarding/on_boarding_view.dart';
import 'package:flutter/material.dart';

class HomePageViewModel {
  static Widget get getScreen {
    bool onBoardingStarted = SharedPreferencesController()
            .getData(SharedPreferencesKeys.onBoarding) ??
        false;
    if (onBoardingStarted) {
      return const BodyView();
    } else {
      return const OnBoardingView();
    }
  }
}
