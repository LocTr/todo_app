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
          const AddTaskState(title: '', body: ''),
        ) {
    on<AddTaskTitleChanged>(_onTitleChanged);
    on<AddTaskBodyChanged>(_onBodyChanged);
    on<AddTaskSubmitted>(_onSubmitted);
  }

  final TasksRepository _tasksRepository;

  void _onTitleChanged(
    AddTaskTitleChanged event,
    Emitter<AddTaskState> emit,
  ) {
    print('event: ' + event.title);
    emit(state.copyWith(title: event.title));
  }

  void _onBodyChanged(
    AddTaskBodyChanged event,
    Emitter<AddTaskState> emit,
  ) {
    emit(state.copyWith(body: event.body));
  }

  Future<void> _onSubmitted(
      AddTaskSubmitted event, Emitter<AddTaskState> emit) async {
    final task = Task(
      title: state.title,
      body: state.body,
      isDone: false,
    );
    print('title:' + task.title);
    await _tasksRepository.saveTask(task);
  }
}
