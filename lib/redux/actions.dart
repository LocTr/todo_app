// an action is a plain JavaScript (or in this case dart) object that
//      describe what happened
// to change something in the state, you need to dispatch an action.
// similar to event in bloc.

import 'package:flutter/cupertino.dart';
import 'package:tasks_api/models/task.dart';

abstract class TodoAction {
  @override
  String toString() {
    // ??
    return '$runtimeType';
  }
}

class AddTodoAction extends TodoAction {
  final Task task;

  AddTodoAction({required this.task});
}

class SetTabFilterAction extends TodoAction {
  final TabFilter filter;
  SetTabFilterAction({required this.filter});
}

class ToggleTodoAction extends TodoAction {
  final int id;
  ToggleTodoAction({required this.id});
}
