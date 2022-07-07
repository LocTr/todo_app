part of 'tasks_view_bloc.dart';

abstract class TasksViewState extends Equatable {
  const TasksViewState();
  
  @override
  List<Object> get props => [];
}

class TasksViewInitial extends TasksViewState {}
