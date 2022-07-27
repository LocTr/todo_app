import 'package:flutter/material.dart';
import 'package:tasks_repository/tasks_repository.dart';

import 'home/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.repository}) : super(key: key);

  // This widget is the root of your application.

  final TasksRepository repository;

  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
