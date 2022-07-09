import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_api/models/task.dart';
import 'package:todo_app/tasks_view/bloc/tasks_view_bloc.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 48,
                child: Checkbox(
                    value: task.isDone,
                    onChanged: (val) async {
                      context
                          .read<TasksViewBloc>()
                          .add(TasksViewCompleteToggled(
                            task: task,
                            isCompleted: val ?? false,
                          ));
                      context
                          .read<TasksViewBloc>()
                          .add(const TasksViewLoadTask());
                    }),
              ),
              Text(
                task.title,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontSize: 24),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 48),
              Text(
                task.body,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
