import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system);
  void changeTheme(BuildContext context) {
    Theme.of(context).brightness == Brightness.dark
        ? state = ThemeMode.light
        : state = ThemeMode.dark;
  }
}

final themeProvider =
    StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) => ThemeNotifier());
