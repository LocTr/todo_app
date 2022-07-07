part of 'add_task_bloc.dart';

class AddTaskState extends Equatable {
  const AddTaskState({required this.title, required this.body});

  final String title;
  final String body;

  AddTaskState copyWith({
    String? title,
    String? body,
  }) {
    return AddTaskState(
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  @override
  List<Object> get props => [title, body];
}
