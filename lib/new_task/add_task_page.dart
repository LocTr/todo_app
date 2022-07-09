import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_repository/tasks_repository.dart';
import 'package:todo_app/new_task/bloc/add_task_bloc.dart';

const String errorTxt = 'Task cannot be empty';

class AddTasksPage extends StatelessWidget {
  const AddTasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddTaskBloc(tasksRepository: context.read<TasksRepository>()),
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
          TextField(
            onChanged: (value) {
              context.read<AddTaskBloc>().add(AddTaskTitleChanged(value));
            },
            autofocus: true,
            decoration: const InputDecoration(
                hintText: 'New task', border: InputBorder.none),
          ),
          TextField(
            onChanged: (value) {
              context.read<AddTaskBloc>().add(AddTaskBodyChanged(value));
            },
            decoration: const InputDecoration(
                hintText: 'Detail', border: InputBorder.none),
          ),
          const SizedBox(height: 16),
          BlocBuilder<AddTaskBloc, AddTaskState>(
            builder: (context, state) {
              return TextButton(
                  onPressed: (state.status == AddTaskStatus.valid)
                      ? () {
                          context
                              .read<AddTaskBloc>()
                              .add(const AddTaskSubmitted());
                          Navigator.pop(context, true);
                        }
                      : null,
                  child: const Text('SAVE'));
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
