part of 'tasks_view_bloc.dart';

class TasksViewState extends Equatable {
  const TasksViewState({
    this.tasks = const [],
    this.filter = TasksViewFilter.all,
  });

  final List<Task> tasks;
  final TasksViewFilter filter;

  Iterable<Task> get filteredTasks => filter.applyAll(tasks);

  TasksViewState copyWith({
    List<Task>? tasks,
    TasksViewFilter? filter,
  }) {
    return TasksViewState(
      tasks: tasks ?? this.tasks,
      filter: filter ?? this.filter,
    );
  }

  @override
  List<Object> get props => [tasks, filter, filteredTasks];
}
