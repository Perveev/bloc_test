import 'package:bloc_test/models/task.dart';
import 'package:equatable/equatable.dart';

class Tasks extends Equatable {
  final _tasks = <Task>[
    Task(title: 'Получить допуск к сессии'),
    Task(title: 'Сдать сессию'),
    Task(title: 'Отпраздновать'),
  ];

  get tasks => _tasks;

  get length => _tasks.length;

  void add(String name) => _tasks.add(Task(title: name));

  void remove(int index) => _tasks.removeAt(index);

  update(Task task) => task.toggleTask();

  List<Object?> get props => [];
}
