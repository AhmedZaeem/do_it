import 'package:do_it/constants.dart';
import 'package:do_it/controllers/shared_preferences_controller.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uuid/v4.dart';

class HiveController {
  final _prefsController = SharedPreferencesController();

  Future<void> initHive() async {
    await Hive.initFlutter();
    try {
      await _openBox(SharedPreferencesKeys.hiveBlock);
      await _openBox(SharedPreferencesKeys.favorite);
    } catch (e) {
      print('Failed to initialize Hive: $e');
    }
  }

  Future<void> _openBox(SharedPreferencesKeys key) async {
    try {
      var boxName = await _prefsController.getData(key) ?? UuidV4().toString();
      await Hive.openBox(boxName);
      _prefsController.saveData(key, boxName);
    } catch (e) {
      return Future.error('error');
    }
  }

  Future<void> put(UuidV4 key, value) async {
    try {
      var boxName =
          await _prefsController.getData(SharedPreferencesKeys.hiveBlock);
      await Hive.box(boxName!).put(key, value);
    } catch (e) {
      return Future.error('error');
    }
  }

  Future<dynamic> get(UuidV4 key) async {
    try {
      var boxName =
          await _prefsController.getData(SharedPreferencesKeys.hiveBlock);
      return Hive.box(boxName!).get(key);
    } catch (e) {
      return Future.error('error');
    }
  }

  Future<void> delete(UuidV4 key) async {
    try {
      var boxName =
          await _prefsController.getData(SharedPreferencesKeys.hiveBlock);
      await Hive.box(boxName!).delete(key);
    } catch (e) {
      return Future.error('error');
    }
  }
}
