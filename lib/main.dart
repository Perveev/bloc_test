import 'package:bloc_test/cubit/cubit_nav.dart';
import 'package:bloc_test/cubit/cubit_tasks.dart';
import 'package:bloc_test/cubit/nav_state.dart';
import 'package:bloc_test/screens/add_task_view.dart';
import 'package:bloc_test/screens/task_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<CubitTasks>(
            create: (context) => CubitTasks(),
          ),
          BlocProvider(
            create: (context) => CubitNav(),
          ),
        ],
        child: BlocListener<CubitNav, TasksNavigationState>(
            listener: (context, state) async {
              if (state is AddTaskNavigationState) {
                final result = await showModalBottomSheet(
                  context: context,
                  builder: (context) => AddTaskScreen(),
                );
                if (result != null) {
                  context.read<CubitTasks>().addTask(result);
                }
              }
            },
            child: TasksView()),
      ),
    );
  }
}
