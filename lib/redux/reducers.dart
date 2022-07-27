// to tie state and actions together, we write a function called a reducer.
// reducer is a function that takes state and action as arg,
//    then return the next state of the app
// this code look like bloc

import 'package:tasks_api/models/task.dart';
import 'package:todo_app/models/models.dart';
import 'package:todo_app/redux/actions.dart';

List<Task> todosReducer(List<Task> state, TodoAction action) {
  if (action is AddTodoAction) {
    return <Task>[
      ...state,
      Task(
        id: action.task.id,
        title: action.task.title,
        body: action.task.body,
      )
    ];
  }

  return state;
}

HomeTab visibilityFilterReducer(HomeTab state, TodoAction action) {
  if (action is SetTabFilterAction) {
    return action.filter;
  }

  return state;
}
