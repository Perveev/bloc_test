import 'package:bloc_test/cubit/cubit_tasks.dart';
import 'package:bloc_test/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final cubitTasks = context.read<CubitTasks>();
        return TaskTile(
          name: cubitTasks.cubitListTask.tasks[index].title,
          isChecked: cubitTasks.cubitListTask.tasks[index].isDone,
          toggleCheckboxState: () => cubitTasks.updateTask(cubitTasks.cubitListTask.tasks[index]),
          removeTask: () => cubitTasks.removeTask(index),
        );
      },
      itemCount: BlocProvider.of<CubitTasks>(context).cubitListTask.length,
    );
  }
}
