import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String name;
  final void Function() toggleCheckboxState;
  final void Function() removeTask;

  TaskTile(
      {required this.name,
      required this.isChecked,
      required this.toggleCheckboxState,
      required this.removeTask});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: removeTask,
      title: Text(
        name,
        style: TextStyle(decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        onChanged: (value) => toggleCheckboxState(),
        value: isChecked,
      ),
    );
  }
}
