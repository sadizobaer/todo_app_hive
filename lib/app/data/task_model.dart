import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject{
  @HiveField(0)
  String taskName;
  @HiveField(1)
  String description;
  @HiveField(2)
  bool isCompletedTask;

  TaskModel({
    required this.taskName,
    required this.description,
    required this.isCompletedTask,
  });
}
