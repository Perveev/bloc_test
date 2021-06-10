import 'package:bloc_test/task.dart';
import 'package:bloc_test/tasks_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitTasks extends Cubit<List<Task>> {
  final tasks = Tasks();

  CubitTasks() : super([]);

  void getTasks() => emit(tasks.tasks);
  void addTask(String name) {
    tasks.add(name);
    getTasks();
  }
  void removeTask(int index){
    tasks.remove(index);
    getTasks();
  }


}