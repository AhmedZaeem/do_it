import 'package:do_it/constants.dart';
import 'package:do_it/controllers/hive_controller.dart';
import 'package:do_it/controllers/shared_preferences_controller.dart';
import 'package:do_it/view_model/theme_view_model/theme_state_changer.dart';
import 'package:do_it/views/home_view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesController().initCache();
  await HiveController().initHive();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        title: 'DoIt!',
        darkTheme: nightMode,
        theme: dayMode,
        themeMode: themeMode,
        home: const HomeView(),
      ),
    );
  }
}
