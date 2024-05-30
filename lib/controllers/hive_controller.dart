import 'package:do_it/constants.dart';
import 'package:do_it/controllers/shared_preferences_controller.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uuid/v4.dart';

import '../models/task_model.dart';

class HiveController {
  final _prefsController = SharedPreferencesController();

  Future<void> initHive() async {
    await Hive.initFlutter();
    try {
      Hive.registerAdapter(TaskModelAdapter());
      await _openBox(SharedPreferencesKeys.hiveBlock);
      await _openBox(SharedPreferencesKeys.favorite);
    } catch (e) {
      print('Failed to initialize Hive: $e');
    }
  }

  Future<void> _openBox(SharedPreferencesKeys key) async {
    try {
      var boxName =
          await _prefsController.getData(key) ?? const UuidV4().toString();
      await Hive.openBox(boxName);
      _prefsController.saveData(key, boxName);
    } catch (e) {
      return Future.error(e);
    }
  }

  put(int key, value) async {
    try {
      var boxName =
          await _prefsController.getData(SharedPreferencesKeys.hiveBlock);
      await Hive.openBox(boxName);
      await Hive.box(boxName!).put(key, value);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<dynamic>> getAll(SharedPreferencesKeys key) async {
    try {
      var boxName = await _prefsController.getData(key);
      return Hive.box(boxName!).values.toList();
    } catch (e) {
      return Future.error('error');
    }
  }

  Future<dynamic> get(int key) async {
    try {
      var boxName =
          await _prefsController.getData(SharedPreferencesKeys.hiveBlock);
      return Hive.box(boxName!).get(key);
    } catch (e) {
      return Future.error('error');
    }
  }

  Future<void> delete(int key) async {
    try {
      var boxName =
          await _prefsController.getData(SharedPreferencesKeys.hiveBlock);
      await Hive.box(boxName!).delete(key);
    } catch (e) {
      return Future.error('error');
    }
  }
}
