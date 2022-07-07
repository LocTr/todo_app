import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_tasks_api/hive_tasks_api.dart';
import 'package:tasks_api/tasks_api.dart';
import 'package:tasks_repository/tasks_repository.dart';

import 'home/home_page.dart';

Future<void> main() async {
  final TasksApi tasksApi = HiveTasksApi(dataBox: await Hive.openBox('tasks'));

  runApp(MyApp(tasksApi: tasksApi));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.tasksApi}) : super(key: key);

  // This widget is the root of your application.
  final TasksApi tasksApi;

  @override
  Widget build(BuildContext context) {
    final repository = TasksRepository(tasksApi: tasksApi);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: BlocProvider(
      //   create: (context) => TabViewCubit(),
      //   child: const HomeView(),
      // ),
      home: const HomePage(),
    );
  }
}
