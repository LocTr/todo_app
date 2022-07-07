part of 'add_task_bloc.dart';

abstract class AddTaskEvent extends Equatable {
  const AddTaskEvent();

  @override
  List<Object> get props => [];
}

class AddTaskTitleChanged extends AddTaskEvent {
  const AddTaskTitleChanged(this.title);

  final String title;

  @override
  List<Object> get props => [title];
}

class AddTaskBodyChanged extends AddTaskEvent {
  const AddTaskBodyChanged(this.body);

  final String body;

  @override
  List<Object> get props => [body];
}

class AddTaskSubmitted extends AddTaskEvent {
  const AddTaskSubmitted();
}
