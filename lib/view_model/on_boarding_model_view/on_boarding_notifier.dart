import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnBoardingNotifier extends StateNotifier<int> {
  OnBoardingNotifier() : super(0);
  void changeIndex() {
    state == 0 ? state = 1 : state = 2;
  }
}

final onBoardingProvider = StateNotifierProvider<OnBoardingNotifier, int>(
    (ref) => OnBoardingNotifier());
