import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todo_flutter/models/task.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks![index];
            return TaskTile(
              isChecked: task.isDone,
              taskTitle: task.name,
              checkboxCallBack: (checkBoxState) {
                taskData.updateTask(task);
              },
              remove: () {
                taskData.removeTask(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
