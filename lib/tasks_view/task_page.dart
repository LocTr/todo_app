import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_repository/tasks_repository.dart';
import 'package:todo_app/widget/task_card.dart';

import 'bloc/tasks_view_bloc.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksViewBloc(
        tasksRepository: context.read<TasksRepository>(),
      )..add(const TasksViewLoadTask()),
      child: const TasksView(),
    );
  }
}

class TasksView extends StatelessWidget {
  const TasksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('rendering task view');
    // List<Task> tasks =
    //     context.read<TasksViewBloc>().state.filteredTasks.toList();
    // if (tasks.isNotEmpty) return _taskList(tasks);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.close),
          const Text(
            'There is no task yet',
          ),
          TextButton(
              onPressed: () {
                context.read<TasksViewBloc>().add(const TasksViewLoadTask());
              },
              child: Text('load data')),
        ],
      ),
    );
  }
}

Widget _noTaskScreen(context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Icon(Icons.close),
        const Text(
          'There is no task yet',
        ),
        TextButton(
            onPressed: () {
              context.read<TasksViewBloc>().add(const TasksViewLoadTask());
            },
            child: Text('load data')),
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
