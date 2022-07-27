import 'package:flutter/material.dart';
import 'package:tasks_repository/tasks_repository.dart';

import 'widget/task_card.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TasksView();
  }
}

class TasksView extends StatelessWidget {
  const TasksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    Widget _taskList(List<Task> tasks) {
      return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 32),
          children: tasks
              .map((task) => TaskCard(
                    task: task,
                    onToggleCheckBox: (val) {},
                  ))
              .toList());
    }

    return _taskList([]);

    return _noTaskScreen();
  }
}
