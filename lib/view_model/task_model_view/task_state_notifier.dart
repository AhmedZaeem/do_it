import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:do_it/models/task_model.dart';
import 'package:do_it/controllers/hive_controller.dart';

class TaskStateNotifier extends StateNotifier<List<TaskModel>> {
  final _hiveController = HiveController();

  TaskStateNotifier() : super([]) {
    getAllTasks();
  }

  addTask(int key, TaskModel value) async {
    await _hiveController.put(key, value);
    state.add(value);
  }

  removeTask(int key) async {
    state.removeWhere((element) => element.id == key);
    await _hiveController.delete(key);
  }

  void updateTask(int key, TaskModel value) {
    var index = state.indexWhere((element) => element.id == key);
    if (index != -1) {
      state[index] = value;
      _hiveController.put(key, value);
    }
  }

  getAllTasks() {
    var values = _hiveController.getAll();
    state = values.map((e) => e as TaskModel).toList().reversed.toList();
    return state;
  }

  List<TaskModel> getFavoriteTasks() {
    var values = _hiveController.getAll();
    state = [];
    state = values
        .map((e) => e as TaskModel)
        .toList()
        .reversed
        .toList()
        .where((element) => element.favorite)
        .toList();
    return state;
  }
}

final taskChangeNotifier =
    StateNotifierProvider<TaskStateNotifier, List<TaskModel>>(
        (ref) => TaskStateNotifier());
