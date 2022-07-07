import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasks_repository/tasks_repository.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  AddTaskBloc({
    required TasksRepository tasksRepository,
  })  : _tasksRepository = tasksRepository,
        super(
          const AddTaskState(task: Task(id: 0, title: '')),
        ) {
    on<AddTaskEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  final TasksRepository _tasksRepository;
}
