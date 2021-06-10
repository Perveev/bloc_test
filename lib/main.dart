import 'package:bloc_test/cubit_tasks.dart';
import 'package:bloc_test/task_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<CubitTasks>(
        create: (context) => CubitTasks(),
        child: TasksView(),
      ),
    );
  }
}
