import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasks_repository/tasks_repository.dart';
import 'package:todo_app/new_task/bloc/add_task_bloc.dart';
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
    try {
      List<Task> tasks = await _tasksRepository.getTasks();
      emit(state.copyWith(tasks: tasks, status: TasksViewStatus.success));
    } catch (e) {
      emit(state.copyWith(status: TasksViewStatus.failure));
    }
  }

  Future<void> _onTasksViewCompleteToggled(
      TasksViewCompleteToggled event, Emitter<TasksViewState> emit) async {
    try {
      await _tasksRepository
          .updateTask(event.task.copyWith(isDone: event.isCompleted));
    } catch (e) {
      emit(state.copyWith(status: TasksViewStatus.failure));
    }
  }

  Future<void> _onTasksViewFilterChanged(
    TasksViewFilterChanged event,
    Emitter<TasksViewState> emit,
  ) async {
    emit(state.copyWith(filter: event.filter));
  }
}
