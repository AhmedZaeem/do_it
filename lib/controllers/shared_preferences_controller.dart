import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class SharedPreferencesController {
  SharedPreferencesController._();
  static SharedPreferencesController cache = SharedPreferencesController._();
  factory SharedPreferencesController() => cache;
  late SharedPreferences preferences;
  Future<void> initCache() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveData(SharedPreferencesKeys key, value) async {
    if (value is String) {
      await preferences.setString(key.name, value);
    } else if (value is bool) {
      await preferences.setBool(key.name, value);
    }
  }

  getData(SharedPreferencesKeys key) {
    return preferences.get(key.name);
  }
}
