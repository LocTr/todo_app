part of 'add_task_bloc.dart';

class AddTaskState extends Equatable {
  const AddTaskState({required this.task});

  final Task task;

  @override
  List<Object> get props => [task];
}
