import 'package:bloc_test/task.dart';

class Tasks {
  final _tasks = <Task>[
    Task(title: 'name'),
    Task(title: 'name1'),
    Task(title: 'name2'),
  ];

  get tasks => _tasks;

  void add(String name) => _tasks.add(Task(title: name));

  void remove(int index) => _tasks.removeAt(index);

  void update(Task task) => task.toggleTask();

}
