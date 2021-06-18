import 'package:bloc_test/models/task.dart';
import 'package:equatable/equatable.dart';

abstract class TaskListState extends Equatable {}

class LoadingTasksState extends TaskListState {
  List<Object?> get props => [];
}

class ShowTasksState extends TaskListState {
  final List<Task>? tasks;

  ShowTasksState({this.tasks});

  List<Object?> get props => [tasks];
}

class UpdateList extends TaskListState {
  final List<Task>? tasks;

  UpdateList({required this.tasks});

  List<Object?> get props => [tasks];
}
