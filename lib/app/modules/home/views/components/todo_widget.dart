import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app_hive/app/data/task_model.dart';

class ToDoWidget extends StatelessWidget {
  final TaskModel taskModel;
  final void Function(bool?)? onChanged;
  void Function(BuildContext)? onPressed;
  ToDoWidget({super.key, required this.taskModel, this.onChanged, this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Slidable(
        endActionPane: _endActionPane(),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: _todoBoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _checkBoxAndTitle(),
              _description(),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _todoBoxDecoration() {
    return BoxDecoration(
      color: Colors.yellow,
      borderRadius: BorderRadius.circular(12),
    );
  }

  Padding _description() {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Text(
        taskModel.description,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          decoration: taskModel.isCompletedTask ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
    );
  }

  Row _checkBoxAndTitle() {
    return Row(
      children: [
        Checkbox(
          value: taskModel.isCompletedTask,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          onChanged: onChanged,
          activeColor: Colors.indigo,
        ),
        Text(
          taskModel.taskName,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            decoration: taskModel.isCompletedTask ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
      ],
    );
  }

  ActionPane _endActionPane() {
    return ActionPane(
      motion: const StretchMotion(),
      children: [
        SlidableAction(
          onPressed: onPressed,
          icon: Icons.delete,
          backgroundColor: Colors.redAccent.shade200,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
      ],
    );
  }
}
