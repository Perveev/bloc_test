import 'package:bloc_test/cubit/cubit_nav.dart';
import 'package:bloc_test/cubit/task_state.dart';
import 'package:bloc_test/cubit/cubit_tasks.dart';
import 'package:bloc_test/widgets/task_list_widget.dart';
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
    context.read<CubitTasks>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CubitTasks, TaskListState>(
        builder: (context, state) {
          if (state is LoadingTasksState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ShowTasksState) {
            context.read<CubitTasks>().fetchTasks();
            return TaskListWidget();
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CubitNav>().addNewTask();
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
