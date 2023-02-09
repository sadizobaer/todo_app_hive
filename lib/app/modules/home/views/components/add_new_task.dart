import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_hive/app/data/task_model.dart';

import 'package:todo_app_hive/app/modules/home/controllers/home_controller.dart';

class AddNewTaskPage extends GetView<HomeController> {
  const AddNewTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      titlePadding: const EdgeInsets.only(top: 32),
      title: Center(
        child: Text(
          'Add Task'.toUpperCase(),
          style: const TextStyle(
            color: Colors.indigo,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller.taskController,
              decoration: const InputDecoration(
                hintText: 'Your task name',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.descriptionController,
              decoration: const InputDecoration(
                hintText: 'Your task description',
              ),
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                _actionButton(
                  name: 'Add',
                  onTap: onAdd,
                ),
                const SizedBox(width: 10),
                _actionButton(
                  name: 'Cancel',
                  onTap: onCancel,
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void onAdd() {
    Get.back();
    if (controller.taskController.text != '' &&
        controller.descriptionController.text != '') {
      controller.addTask(
        TaskModel(
          taskName: controller.taskController.text,
          description: controller.descriptionController.text,
          isCompletedTask: false,
        ),
      );
    }
  }

  void onCancel() {
    Get.back();
  }

  Expanded _actionButton({required String name, void Function()? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.indigo,
          ),
          child: Center(
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
