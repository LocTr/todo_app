import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_repository/tasks_repository.dart';
import 'package:todo_app/home/cubit/tab_view_cubit.dart';
import 'package:todo_app/tasks_view/models/tasks_view_filter.dart';

import 'bloc/tasks_view_bloc.dart';
import 'widget/task_card.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<TabViewCubit, TabViewState>(
          listener: (context, state) {
            switch (state.currentTab) {
              case HomeTab.all:
                context.read<TasksViewBloc>().add(
                      const TasksViewFilterChanged(filter: TasksViewFilter.all),
                    );
                break;
              case HomeTab.completed:
                context.read<TasksViewBloc>().add(
                      const TasksViewFilterChanged(
                          filter: TasksViewFilter.done),
                    );
                break;
              case HomeTab.uncompleted:
                context.read<TasksViewBloc>().add(
                      const TasksViewFilterChanged(
                          filter: TasksViewFilter.todo),
                    );
                break;
            }
          },
        ),
        BlocListener<TasksViewBloc, TasksViewState>(
          listener: (context, state) {
            if (state.status == TasksViewStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Error occured, please try again later!')));
            }
          },
        ),
      ],
      child: const TasksView(),
    );
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
                    onToggleCheckBox: (val) {
                      context
                          .read<TasksViewBloc>()
                          .add(TasksViewCompleteToggled(
                            task: task,
                            isCompleted: val ?? false,
                          ));
                      context
                          .read<TasksViewBloc>()
                          .add(const TasksViewLoadTask());
                    },
                  ))
              .toList());
    }

    List<Task> tasks =
        context.watch<TasksViewBloc>().state.filteredTasks.toList();
    if (tasks.isNotEmpty) return _taskList(tasks);

    return _noTaskScreen();
  }
}
