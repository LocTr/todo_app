library hive_tasks_api;

import 'package:hive/hive.dart';
import 'package:tasks_api/tasks_api.dart';

enum HiveTaskData {
  id,
  title,
  body,
  isDone,
}

class HiveTasksApi extends TasksApi {
  HiveTasksApi({required this.dataBox});

  final Box dataBox;

  @override
  Future<List<Task>> getTask() async {
    List<Task> list = [];

    for (var element in dataBox.values) {
      Task task = Task(
          id: element[HiveTaskData.id.index],
          title: element[HiveTaskData.title.index],
          body: element[HiveTaskData.body.index],
          isDone: element[HiveTaskData.isDone.index]);
      list.add(task);
    }
    return list;
  }

  @override
  Future<void> clearCompleted() async {
    for (var element in dataBox.values) {
      if (element[HiveTaskData.isDone.index] == true) {
        dataBox.deleteAt(element[HiveTaskData.id.index]);
      }
    }
    return;
  }

  @override
  Future<void> deleteTask(int id) async {
    await dataBox.deleteAt(id);
    return;
  }

  @override
  Future<void> saveTask(Task task) async {
    final int id = dataBox.length;
    await dataBox.add(task.copyWith(id: id));
    return;
  }
}
