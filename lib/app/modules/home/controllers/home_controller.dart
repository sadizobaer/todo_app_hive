import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo_app_hive/app/data/task_model.dart';

class HomeController extends GetxController {
  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime initialDate = DateTime.now();
  Rx<List<TaskModel>?> allTasks = Rx<List<TaskModel>?>(null);

  @override
  void onInit() {
    init();
    super.onInit();
  }

  @override
  void onClose() {
    Hive.close();
    super.onClose();
  }

  late Box<TaskModel> _tasks;
  Future<void> init() async {
    _tasks = await Hive.openBox<TaskModel>('my_todo');
    allTasks.value = getTasks();
  }

  List<TaskModel> getTasks() {
    final tasks = _tasks.values;
    return tasks.toList();
  }

  void addTask(TaskModel taskModel) {
    _tasks.add(taskModel);
    allTasks.value = getTasks();
  }

  void removeTask(TaskModel taskModel) async {
    final taskToRemove =
        _tasks.values.firstWhere((element) => element == taskModel);
    await taskToRemove.delete();
    allTasks.value = getTasks();
  }

  void updateTask(TaskModel taskModel) {
    final taskToEdit = _tasks.values
        .firstWhere((element) => element.taskName == taskModel.taskName);
    final index = taskToEdit.key as int;
    _tasks.put(index, taskModel);
    allTasks.value = getTasks();
  }
}
