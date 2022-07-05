import 'package:equatable/equatable.dart';

class Task extends Equatable {
  const Task({required this.title, this.body});

  final String title;
  final String? body;

  @override
  List<Object?> get props => [title, body];
}
