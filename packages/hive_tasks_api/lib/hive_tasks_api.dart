library hive_tasks_api;

import 'package:hive/hive.dart';
import 'package:tasks_api/tasks_api.dart';

class HiveTasksApi extends TasksApi {
  HiveTasksApi({required this.dataBox});

  final Box<Task> dataBox;

  @override
  Future<List<Task>> getTask() async {
    return dataBox.values.toList();
  }

  @override
  Future<void> clearCompleted() async {
    dataBox.toMap().forEach((key, value) async {
      if (value.isDone == true) {
        await dataBox.delete(key);
      }
    });
    return;
  }

  @override
  Future<void> deleteTask(String id) async {
    await dataBox.delete(id);
    return;
  }

  @override
  Future<void> saveTask(Task task) async {
    await dataBox.add(task);
    return;
  }
}
