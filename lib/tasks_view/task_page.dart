import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_repository/tasks_repository.dart';
import 'package:todo_app/widget/task_card.dart';

import 'bloc/tasks_view_bloc.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => TasksViewBloc(
    //     tasksRepository: context.read<TasksRepository>(),
    //   )..add(const TasksViewLoadTask()),
    //   child: const TasksView(),
    // );
    return const TasksView();
  }
}

class TasksView extends StatelessWidget {
  const TasksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Task> tasks =
        context.watch<TasksViewBloc>().state.filteredTasks.toList();
    if (tasks.isNotEmpty) return _taskList(tasks);
    return _noTaskScreen();
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

Widget _taskList(List<Task> tasks) {
  return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 32),
      children: tasks
          .map((task) => TaskCard(
                isDone: task.isDone,
                title: task.title,
                content: task.body,
              ))
          .toList());
}
