import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tasks_view_event.dart';
part 'tasks_view_state.dart';

class TasksViewBloc extends Bloc<TasksViewEvent, TasksViewState> {
  TasksViewBloc() : super(TasksViewInitial()) {
    on<TasksViewEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
