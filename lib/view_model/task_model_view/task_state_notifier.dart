import 'package:do_it/controllers/hive_controller.dart';
import 'package:do_it/models/task_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/v4.dart';

class TaskStateNotifier extends StateNotifier<List<TaskModel>> {
  TaskStateNotifier() : super([]);
  void addTask(UuidV4 key, TaskModel value) {
    state.add(value);
    HiveController().put(key, value);
  }

  void removeTask(UuidV4 key) {
    state.removeWhere((TaskModel element) => element.id == key);
    HiveController().delete(key);
  }

  void updateTask(UuidV4 key, TaskModel value) {
    state[state.indexWhere((TaskModel element) => element.id == key)] = value;
    HiveController().put(key, value);
  }

  get isEmpty => state.isEmpty;
}

final taskChangeNotifier =
    StateNotifierProvider<TaskStateNotifier, List<TaskModel>>(
        (ref) => TaskStateNotifier());
