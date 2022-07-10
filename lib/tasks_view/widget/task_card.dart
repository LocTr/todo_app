import 'package:flutter/material.dart';
import 'package:tasks_api/models/task.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key? key,
    required this.task,
    required this.onToggleCheckBox,
  }) : super(key: key);

  final Task task;
  final Function(bool?)? onToggleCheckBox;
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
                  onChanged: onToggleCheckBox,
                ),
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
