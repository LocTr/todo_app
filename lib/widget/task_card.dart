import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key? key,
    required this.isDone,
    required this.title,
    this.content,
  }) : super(key: key);

  final bool isDone;
  final String title;
  final String? content;
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
                child: Checkbox(value: false, onChanged: (val) {}),
              ),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontSize: 24),
              ),
            ],
          ),
          if (content != null)
            Row(
              children: [
                const SizedBox(width: 48),
                Text(
                  content ?? '',
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
