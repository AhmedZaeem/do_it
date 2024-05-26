import 'package:do_it/constants.dart';
import 'package:do_it/views/home_view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        title: 'DoIt!',
        darkTheme: nightMode,
        theme: dayMode,
        themeMode: ThemeMode.dark,
        home: const Scaffold(
          body: HomeView(),
        ),
      ),
    );
  }
}
