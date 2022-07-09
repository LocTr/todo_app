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
    on<TasksViewCompleteToggled>(_onTasksViewCompleteToggled);
    on<TasksViewFilterChanged>(_onTasksViewFilterChanged);
  }

  final TasksRepository _tasksRepository;

  Future<void> _onTasksViewLoadTask(
    TasksViewLoadTask event,
    Emitter<TasksViewState> emit,
  ) async {
    List<Task> tasks = await _tasksRepository.getTasks();
    emit(state.copyWith(tasks: tasks));
  }

  Future<void> _onTasksViewCompleteToggled(
      TasksViewCompleteToggled event, Emitter<TasksViewState> emit) async {
    await _tasksRepository
        .updateTask(event.task.copyWith(isDone: event.isCompleted));
  }

  Future<void> _onTasksViewFilterChanged(
    TasksViewFilterChanged event,
    Emitter<TasksViewState> emit,
  ) async {
    emit(state.copyWith(filter: event.filter));
  }
}
