import 'package:hive_flutter/adapters.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(1)
  String task;
  @HiveField(2)
  String title;
  @HiveField(3)
  String date;
  @HiveField(4)
  bool isCompleted;
  @HiveField(0)
  int id;
  @HiveField(5)
  bool favorite;

  TaskModel(
      {required this.task,
      this.isCompleted = false,
      required this.id,
      this.favorite = false,
      required this.title,
      required this.date});
}
