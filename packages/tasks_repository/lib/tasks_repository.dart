library tasks_repository;

import 'package:tasks_api/tasks_api.dart';

export 'package:tasks_api/tasks_api.dart' show Task;

/// A Calculator.
class TasksRepository {
  const TasksRepository({
    required TasksApi tasksApi,
  }) : _tasksApi = tasksApi;

  final TasksApi _tasksApi;

  Future<List<Task>> getTasks() {
    return _tasksApi.getTasks();
  }

  Future<void> clearCompleted() async {
    _tasksApi.clearCompleted();
    return;
  }

  Future<void> deleteTask(int id) async {
    _tasksApi.deleteTask(id);
    return;
  }

  Future<void> newTask(Task task) async {
    _tasksApi.newTask(task);
    return;
  }

  Future<void> updateTask(Task task) async {
    _tasksApi.updateTask(task);
    return;
  }
}
