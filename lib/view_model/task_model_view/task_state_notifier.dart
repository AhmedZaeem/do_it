import 'package:do_it/controllers/hive_controller.dart';
import 'package:do_it/models/task_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants.dart';

class TaskStateNotifier extends StateNotifier<List<TaskModel>> {
  final _hiveController = HiveController();

  TaskStateNotifier() : super([]);

  addTask(int key, TaskModel value) async {
    await _hiveController.put(key, value);
    state.add(value);
  }

  void removeTask(int key) {
    state.removeWhere((element) => element.id == key);
    _hiveController.delete(key);
  }

  void updateTask(int key, TaskModel value) {
    var index = state.indexWhere((element) => element.id == key);
    if (index != -1) {
      state[index] = value;
      _hiveController.put(key, value);
    }
  }

  Future<List<TaskModel>> getAllTasks() async {
    try {
      var values =
          await _hiveController.getAll(SharedPreferencesKeys.hiveBlock);
      state = values.map((e) => e as TaskModel).toList();
    } catch (e) {
      print(e);
    }
    return state;
  }

  bool get isEmpty => state.isEmpty;
}

final taskChangeNotifier =
    StateNotifierProvider<TaskStateNotifier, List<TaskModel>>(
        (ref) => TaskStateNotifier());
