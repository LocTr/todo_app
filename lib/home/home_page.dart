import 'package:flutter/material.dart';
import 'package:todo_app/new_task/add_task_page.dart';
import 'package:todo_app/tasks_view/tasks_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) async {
      // if (index == HomeTab.values.length) {
      //   showModalBottomSheet<bool>(
      //       isScrollControlled: true,
      //       context: context,
      //       builder: (context) {
      //         return const AddTasksPage();
      //       }).then((value) => {
      //         if (value == true)
      //           {context.read<TasksViewBloc>().add(const TasksViewLoadTask())}
      //       });
      // } else {
      //   context.read<TabViewCubit>().setTab(HomeTab.values[index]);
      // }
    }

    return Scaffold(
      body: const TasksPage(),
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
      ),
    );
  }
}
