part of 'tasks_view_bloc.dart';

abstract class TasksViewEvent extends Equatable {
  const TasksViewEvent();

  @override
  List<Object> get props => [];
}

class TaskViewCompleteToggled extends TasksViewEvent {}
