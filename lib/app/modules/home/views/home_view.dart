import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_hive/app/data/task_model.dart';
import 'package:todo_app_hive/app/modules/home/views/components/add_new_task.dart';
import 'package:todo_app_hive/app/modules/home/views/components/todo_widget.dart';
import 'package:todo_app_hive/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          addNewTaask(context);
        },
        child: const Icon(
          Icons.add,
          color: Colors.indigo,
          size: 28,
        ),
      ),
      appBar: AppBar(
        title: const Text('TO-DO APP'),
      ),
      body: Obx(
        () => controller.allTasks.value == null
            ? const Center(child: CircularProgressIndicator())
            : controller.allTasks.value!.isEmpty
                ? const Center(child: Text('Add your task first!'))
                : getList(),
      ),
    );
  }

  ListView getList() {
    return ListView.builder(
      itemCount: controller.allTasks.value?.length,
      itemBuilder: (context, index) => ToDoWidget(
        taskModel: controller.allTasks.value![index],
        onChanged: (val) => _onUpdate(index),
        onPressed: (context) => _onDelete(index),
      ),
    );
  }

  void _onUpdate(int index) {
    controller.updateTask(
      TaskModel(
        taskName: controller.allTasks.value![index].taskName,
        description: controller.allTasks.value![index].description,
        isCompletedTask: !controller.allTasks.value![index].isCompletedTask,
      ),
    );
  }

  void _onDelete(int index) {
    controller.removeTask(controller.allTasks.value![index]);
  }
}

Future<dynamic> addNewTaask(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return const AddNewTaskPage();
    },
  );
}
