import 'package:do_it/constants.dart';
import 'package:do_it/controllers/shared_preferences_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system) {
    initTheme();
  }

  Future<void> initTheme() async {
    var theme = await getTheme();
    if (theme != null) {
      state = theme == true ? ThemeMode.dark : ThemeMode.light;
    }
  }

  Future<bool?> getTheme() async {
    return await SharedPreferencesController()
        .getData(SharedPreferencesKeys.darkTheme);
  }

  void changeTheme(BuildContext context) {
    Theme.of(context).brightness == Brightness.dark
        ? state = ThemeMode.light
        : state = ThemeMode.dark;
  }
}

final themeProvider =
    StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) => ThemeNotifier());
