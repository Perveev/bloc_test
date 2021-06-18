import 'package:bloc_test/cubit/cubit_tasks.dart';
import 'package:bloc_test/cubit/nav_state.dart';
import 'package:bloc_test/models/task.dart';
import 'package:bloc_test/models/tasks_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitNav extends Cubit<TasksNavigationState> {
  CubitNav() : super(TasksNavigationInitialState());

  void addNewTask() => emit(AddTaskNavigationState());
}
