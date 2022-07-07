import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/new_task/add_task_dialog.dart';
import 'package:todo_app/tasks_view/task_view.dart';

import 'cubit/tab_view_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabViewCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      if (index == HomeTab.add.index) {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return const AddTaskDialog();
            });
      } else {
        context.read<TabViewCubit>().setTab(HomeTab.values[index]);
      }
    }

    return Scaffold(
      body: const TaskView(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).disabledColor,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedFontSize: 12.0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'All'),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Done'),
          BottomNavigationBarItem(icon: Icon(Icons.close), label: 'To do'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add task'),
        ],
        onTap: _onItemTapped,
        currentIndex: context.watch<TabViewCubit>().state.currentTab.index,
      ),
    );
  }
}
