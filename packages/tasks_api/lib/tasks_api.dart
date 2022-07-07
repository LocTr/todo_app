library tasks_api;

import 'package:tasks_api/models/task.dart';
export 'tasks_api.dart';
export 'models/task.dart';

abstract class TasksApi {
  const TasksApi();

  Stream<List<Task>> getTasks();

  Future<List<Task>> getTask();

  Future<void> saveTask(Task task);

  Future<void> deleteTask(int id);

  Future<void> clearCompleted();
}

class TaskNotFoundException implements Exception {}
