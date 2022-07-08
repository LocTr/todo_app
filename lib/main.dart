import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_tasks_api/hive_tasks_api.dart';
import 'package:tasks_api/tasks_api.dart';
import 'package:tasks_repository/tasks_repository.dart';
import 'package:todo_app/app.dart';

Future<void> main() async {
  await Hive.initFlutter();
  final TasksApi tasksApi = HiveTasksApi(dataBox: await Hive.openBox('tasks'));
  final repository = TasksRepository(tasksApi: tasksApi);
  runApp(App(
    repository: repository,
  ));
}
