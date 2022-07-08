part of 'tasks_view_bloc.dart';

abstract class TasksViewEvent extends Equatable {
  const TasksViewEvent();

  @override
  List<Object> get props => [];
}

class TasksViewCompleteToggled extends TasksViewEvent {
  const TasksViewCompleteToggled({
    required this.task,
    required this.isCompleted,
  });

  final Task task;
  final bool isCompleted;

  @override
  List<Object> get props => [task, isCompleted];
}

class TasksViewFilterChanged extends TasksViewEvent {
  const TasksViewFilterChanged({
    required this.filter,
  });

  final TasksViewFilter filter;

  @override
  List<Object> get props => [filter];
}

class TasksViewLoadTask extends TasksViewEvent {
  const TasksViewLoadTask();
}
