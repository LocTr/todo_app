import 'package:equatable/equatable.dart';

class Task extends Equatable {
  const Task({
    this.id = 0,
    required this.title,
    this.body = '',
    this.isDone = false,
  });

  final int id;
  final String title;
  final String body;
  final bool isDone;

  Task copyWith({
    int? id,
    String? title,
    String? body,
    bool? isDone,
  }) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
        isDone: isDone ?? this.isDone,
      );

  @override
  List<Object?> get props => [id, title, body, isDone];
}
