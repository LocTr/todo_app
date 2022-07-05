import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/tab_view_cubit/tab_view_cubit.dart';
import 'package:todo_app/screen/add_task_dialog.dart';
import 'package:todo_app/screen/task_screen.dart';

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
      body: const TaskScreen(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).disabledColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'All'),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Completed'),
          BottomNavigationBarItem(
              icon: Icon(Icons.close), label: 'Incompleted'),
          // TODO: change color to secondary
          BottomNavigationBarItem(
              icon: Icon(Icons.add, color: Color.fromARGB(255, 255, 136, 215)),
              label: 'Add'),
        ],
        onTap: _onItemTapped,
        currentIndex: context.watch<TabViewCubit>().state.currentTab.index,
      ),
    );
  }
}
