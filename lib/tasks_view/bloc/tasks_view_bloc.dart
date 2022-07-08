import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasks_repository/tasks_repository.dart';
import 'package:todo_app/tasks_view/models/tasks_view_filter.dart';

part 'tasks_view_event.dart';
part 'tasks_view_state.dart';

class TasksViewBloc extends Bloc<TasksViewEvent, TasksViewState> {
  TasksViewBloc({required tasksRepository})
      : _tasksRepository = tasksRepository,
        super(const TasksViewState()) {
    on<TasksViewLoadTask>(_onTasksViewLoadTask);
  }

  final TasksRepository _tasksRepository;

  Future<void> _onTasksViewLoadTask(
    TasksViewLoadTask event,
    Emitter<TasksViewState> emit,
  ) async {
    print('loading tasks');
    _tasksRepository.getAllTasks();
  }

  // Future<void> _onTasksViewCompleteToggled(
  //   TasksViewCompleteToggled event,
  //   Emitter<TasksViewState> emit,
  // ) async {
  //   _tasksRepository.saveTask(task)
  // }
}
