import 'package:do_it/controllers/shared_preferences_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uuid/v4.dart';

import '../constants.dart';

class HiveController {
  final _prefsController = SharedPreferencesController();

  Future<void> initHive() async {
    await Hive.initFlutter();
    try {
      await _openBox(SharedPreferencesKeys.hiveBlock);
      await _openBox(SharedPreferencesKeys.favorite);
    } catch (e) {
      if (kDebugMode) {
        print('Failed to initialize Hive: $e');
      }
    }
  }

  Future<void> _openBox(SharedPreferencesKeys key) async {
    try {
      var boxName = await _prefsController.getData(key);
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
      var box = await Hive.openBox(boxName!);
      await box.put(key, value);
      await box.close();
    } catch (e) {
      return Future.error('error');
    }
  }

  Future<dynamic> get(UuidV4 key) async {
    try {
      var boxName =
          await _prefsController.getData(SharedPreferencesKeys.hiveBlock);
      var box = await Hive.openBox(boxName!);
      var value = box.get(key);
      await box.close();
      return value;
    } catch (e) {
      return Future.error('error');
    }
  }

  Future<void> delete(UuidV4 key) async {
    try {
      var boxName =
          await _prefsController.getData(SharedPreferencesKeys.hiveBlock);
      var box = await Hive.openBox(boxName!);
      await box.delete(key);
      await box.close();
    } catch (e) {
      return Future.error('error');
    }
  }

  Future<List<dynamic>> getAll() async {
    try {
      var boxName =
          await _prefsController.getData(SharedPreferencesKeys.hiveBlock);
      var box = await Hive.openBox(boxName!);
      var values = box.values.toList();
      await box.close();
      return values;
    } catch (e) {
      return [];
    }
  }
}
