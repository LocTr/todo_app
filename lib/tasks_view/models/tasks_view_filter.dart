import 'package:tasks_api/models/task.dart';

enum TasksViewFilter {
  all,
  todo,
  done;

  bool apply(Task task) {
    switch (this) {
      case TasksViewFilter.all:
        return true;
      case TasksViewFilter.todo:
        return !task.isDone;
      case TasksViewFilter.done:
        return task.isDone;
    }
  }

  Iterable<Task> applyAll(Iterable<Task> tasks) {
    return tasks.where(apply);
  }
}
