library tasks_repository;

import 'package:tasks_api/tasks_api.dart';

export 'package:tasks_api/tasks_api.dart' show Task;

/// A Calculator.
class TasksRepository {
  const TasksRepository({
    required TasksApi tasksApi,
  }) : _tasksApi = tasksApi;

  final TasksApi _tasksApi;

  Future<List<Task>> getAllTasks() {
    return _tasksApi.getTask();
  }

  Future<List<Task>> getCompletedTasks() {
    return _tasksApi.getTask();
  }

  Future<List<Task>> getUncompletedTasks() {
    return _tasksApi.getTask();
  }

  Future<void> clearCompleted() async {
    _tasksApi.clearCompleted();
    return;
  }

  Future<void> deleteTask(int id) async {
    _tasksApi.deleteTask(id);
    return;
  }

  Future<void> saveTask(Task task) async {
    _tasksApi.saveTask(task);
    return;
  }
}
