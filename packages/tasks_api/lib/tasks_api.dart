library tasks_api;

import 'package:tasks_api/models/task.dart';
export 'tasks_api.dart';
export 'models/task.dart';

abstract class TasksApi {
  const TasksApi();

  Stream<List<Task>> getTasksStream();

  Future<List<Task>> getTasks();

  Future<void> updateTask(Task task);

  Future<void> newTask(Task task);

  Future<void> deleteTask(int id);

  Future<void> clearCompleted();

  Future<void> deleteAllTask();
}

class TaskNotFoundException implements Exception {}
