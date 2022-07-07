import 'package:flutter/material.dart';
import 'package:todo_app/widget/task_card.dart';

class TaskView extends StatelessWidget {
  const TaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _taskList();
  }
}

Widget _noTaskScreen() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Icon(Icons.close),
        Text(
          'There is no task yet',
        ),
      ],
    ),
  );
}

Widget _taskList() {
  return ListView(
    padding: const EdgeInsets.all(8.0),
    children: const [
      SizedBox(height: 24),
      TaskCard(
        isDone: false,
        title: 'Buy spagetti',
        content: 'In the supermarket',
      ),
      TaskCard(
        isDone: false,
        title: 'Exercise',
      ),
      TaskCard(
        isDone: false,
        title: 'Be Iron Man',
        content: 'be rich\n???\nprofit',
      ),
    ],
  );
}
