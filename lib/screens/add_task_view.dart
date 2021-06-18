import 'package:bloc_test/constans/palette.dart';
import 'package:bloc_test/constans/styles.dart';
import 'package:bloc_test/models/new_task.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final newTask = NewTask();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.buttomSheetBackground,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Add Task",
                textAlign: TextAlign.center,
                style: TextStyles.BottomSheetLabel,
              ),
              TextField(
                onChanged: (newValue) => newTask.title = newValue,
                autofocus: true,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  color: Colors.lightBlueAccent,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context, newTask.title);
                    },
                    child: const Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
