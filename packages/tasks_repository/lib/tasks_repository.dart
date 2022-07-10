library tasks_repository;

import 'package:tasks_api/tasks_api.dart';

export 'package:tasks_api/tasks_api.dart' show Task;

class TasksRepository {
  const TasksRepository({
    required TasksApi tasksApi,
  }) : _tasksApi = tasksApi;

  final TasksApi _tasksApi;

  Future<List<Task>> getTasks() {
    return _tasksApi.getTasks();
  }

  Future<void> clearCompleted() async {
    await _tasksApi.clearCompleted();
    return;
  }

  Future<void> deleteTask(int id) async {
    await _tasksApi.deleteTask(id);
    return;
  }

  Future<void> newTask(Task task) async {
    await _tasksApi.newTask(task);
    return;
  }

  Future<void> updateTask(Task task) async {
    await _tasksApi.updateTask(task);
    return;
  }
}
