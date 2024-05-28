import 'package:uuid/v4.dart';

class TaskModel {
  String task;
  bool isCompleted;
  UuidV4 id;
  bool favorite;

  TaskModel(
      {required this.task,
      required this.isCompleted,
      required this.id,
      required this.favorite});
}
