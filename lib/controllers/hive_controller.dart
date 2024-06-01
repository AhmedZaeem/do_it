import 'package:do_it/constants.dart';
import 'package:do_it/controllers/shared_preferences_controller.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uuid/v4.dart';

import '../models/task_model.dart';

class HiveController {
  var boxName = 'hive';
  Future<void> initHive() async {
    await Hive.initFlutter();
    try {
      Hive.registerAdapter(TaskModelAdapter());
      await Hive.openBox(boxName);
    } catch (e) {
      print('Failed to initialize Hive: $e');
    }
  }

  put(int key, value) async {
    try {
      await Hive.box(boxName).put(key, value);
    } catch (e) {
      return Future.error(e);
    }
  }

  List<dynamic> getAll() {
    try {
      return Hive.box(boxName).values.toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> delete(int key) async {
    try {
      await Hive.box(boxName).delete(key);
    } catch (e) {
      return Future.error('error');
    }
  }
}
