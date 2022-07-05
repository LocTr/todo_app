import 'package:flutter/material.dart';

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
          const TextField(
            autofocus: true,
            decoration:
                InputDecoration(hintText: 'New task', border: InputBorder.none),
          ),
          const TextField(
            decoration:
                InputDecoration(hintText: 'Detail', border: InputBorder.none),
          ),
          const SizedBox(height: 16),
          TextButton(onPressed: () {}, child: const Text('SAVE')),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
