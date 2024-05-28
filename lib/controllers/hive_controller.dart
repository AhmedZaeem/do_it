import 'package:do_it/constants.dart';
import 'package:do_it/controllers/shared_preferences_controller.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uuid/v4.dart';

class HiveController {
  static initHive() async {
    SharedPreferencesController sharedPreferencesController =
        SharedPreferencesController();
    await Hive.initFlutter();
    if (sharedPreferencesController.getData(SharedPreferencesKeys.hiveBlock) !=
        null) {
      await Hive.openBox(sharedPreferencesController
          .getData(SharedPreferencesKeys.hiveBlock)!);
    } else {
      UuidV4 hiveBox = const UuidV4();
      SharedPreferencesController()
          .saveData(SharedPreferencesKeys.hiveBlock, hiveBox.toString());
      await Hive.openBox(hiveBox.toString());
    }
  }
}
