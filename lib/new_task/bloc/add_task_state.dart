part of 'add_task_bloc.dart';

enum AddTaskStatus { initial, success, failure }

class AddTaskState extends Equatable {
  const AddTaskState({
    required this.title,
    required this.body,
    this.status = AddTaskStatus.initial,
  });

  final String title;
  final String body;
  final AddTaskStatus status;

  AddTaskState copyWith({
    String? title,
    String? body,
    AddTaskStatus? status,
  }) {
    return AddTaskState(
        title: title ?? this.title,
        body: body ?? this.body,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [title, body, status];
}
