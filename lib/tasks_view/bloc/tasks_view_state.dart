part of 'tasks_view_bloc.dart';

enum TasksViewStatus { initial, success, failure }

class TasksViewState extends Equatable {
  const TasksViewState({
    this.tasks = const [],
    this.filter = TasksViewFilter.all,
    this.status = TasksViewStatus.initial,
  });

  final List<Task> tasks;
  final TasksViewFilter filter;
  final TasksViewStatus status;

  Iterable<Task> get filteredTasks => filter.applyAll(tasks);

  TasksViewState copyWith({
    List<Task>? tasks,
    TasksViewFilter? filter,
    TasksViewStatus? status,
  }) {
    return TasksViewState(
        tasks: tasks ?? this.tasks,
        filter: filter ?? this.filter,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [tasks, filter, filteredTasks, status];
}
