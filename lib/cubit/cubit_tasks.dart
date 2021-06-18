import 'package:bloc_test/cubit/task_state.dart';
import 'package:bloc_test/models/task.dart';
import 'package:bloc_test/models/tasks_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitTasks extends Cubit<TaskListState> {
  final cubitListTask = Tasks();

  List<Object> get props => [cubitListTask];

  CubitTasks() : super(ShowTasksState());

  void fetchTasks() => emit(ShowTasksState());

  void addTask(String name) {
    cubitListTask.add(name);
    emit(ShowTasksState(tasks:cubitListTask.tasks));
  }

  void removeTask(int index) {
    cubitListTask.remove(index);
    emit(ShowTasksState(tasks: cubitListTask.tasks));
  }

  void updateTask(Task task) {
    cubitListTask.update(task);
    emit(ShowTasksState(tasks: cubitListTask.tasks));
  }
}
