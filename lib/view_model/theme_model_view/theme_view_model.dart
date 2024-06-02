import 'package:do_it/view_model/theme_model_view/theme_state_changer.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../controllers/shared_preferences_controller.dart';

class ThemeViewModel {
  static onThemeSwitch(context) async {
    final selectedTheme = context.read(themeProvider);
    if (selectedTheme == ThemeMode.dark) {
      await SharedPreferencesController()
          .saveData(SharedPreferencesKeys.darkTheme, false);
    } else {
      await SharedPreferencesController()
          .saveData(SharedPreferencesKeys.darkTheme, true);
    }
    context.read(themeProvider.notifier).changeTheme(context);
  }
}
