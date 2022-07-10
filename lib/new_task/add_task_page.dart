import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_repository/tasks_repository.dart';
import 'package:todo_app/new_task/bloc/add_task_bloc.dart';

class AddTasksPage extends StatelessWidget {
  const AddTasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddTaskBloc(tasksRepository: context.read<TasksRepository>()),
      child: const AddTasksView(),
    );
  }
}

class AddTasksView extends StatelessWidget {
  const AddTasksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddTaskBloc, AddTaskState>(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status == AddTaskStatus.success,
      listener: (context, state) {
        Navigator.of(context).pop(true);
      },
      child: const AddTaskDialog(),
    );
  }
}

class AddTaskDialog extends StatelessWidget {
  const AddTaskDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 8,
          right: 8,
          top: 8,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<AddTaskBloc, AddTaskState>(
            builder: (context, state) {
              final errorStr = (state.status == AddTaskStatus.failure)
                  ? 'Error occured, please try again later'
                  : null;
              return TextField(
                onChanged: (value) {
                  context.read<AddTaskBloc>().add(AddTaskTitleChanged(value));
                },
                autofocus: true,
                decoration: InputDecoration(
                    hintText: 'New task',
                    border: InputBorder.none,
                    errorText: errorStr),
              );
            },
          ),
          TextField(
            onChanged: (value) {
              context.read<AddTaskBloc>().add(AddTaskBodyChanged(value));
            },
            decoration: const InputDecoration(
                hintText: 'Detail', border: InputBorder.none),
          ),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<AddTaskBloc, AddTaskState>(
            builder: (context, state) {
              return Column(
                children: [
                  TextButton(
                      onPressed: (state.status == AddTaskStatus.valid ||
                              state.status == AddTaskStatus.failure)
                          ? () {
                              context
                                  .read<AddTaskBloc>()
                                  .add(const AddTaskSubmitted());
                            }
                          : null,
                      child: const Text('SAVE')),
                ],
              );
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
