class TaskModel {
  String task;
  bool isCompleted;
  String id;
  bool favorite;

  TaskModel(
      {required this.task,
      required this.isCompleted,
      required this.id,
      required this.favorite});
}
