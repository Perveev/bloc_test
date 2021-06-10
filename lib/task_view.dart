import 'package:bloc_test/cubit_tasks.dart';
import 'package:bloc_test/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksView extends StatefulWidget {
  @override
  _TasksViewState createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CubitTasks>(context).getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CubitTasks, List<Task>>(
        listener: (context, tasks) {
          if (tasks.isEmpty) {
            Center(
              child: CircularProgressIndicator(),
            );
          }
          _taskListWidget(tasks);
        },
        builder: (context, tasks) => _taskListWidget(tasks),
      ),
    );
  }

  Widget _taskListWidget(List<Task> tasks) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Card(
            child: ListTile(
              title: Text(tasks[index].title),
            ),
          ),
          onTap: () => {
            BlocProvider.of<CubitTasks>(context).addTask("name ${tasks.length}"),
          },
          onLongPress: () => BlocProvider.of<CubitTasks>(context).removeTask(index),
        );
      },
      itemCount: tasks.length,
    );
  }
}
