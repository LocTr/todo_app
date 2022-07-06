import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task extends Equatable {
  const Task(
      {required this.id, this.isDone = false, required this.title, this.body});

  @HiveField(0)
  final int id;
  @HiveField(1)
  final bool isDone;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? body;

  @override
  List<Object?> get props => [title, body];
}
