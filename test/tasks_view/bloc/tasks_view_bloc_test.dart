import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tasks_repository/tasks_repository.dart';
import 'package:todo_app/tasks_view/bloc/tasks_view_bloc.dart';
import 'package:todo_app/tasks_view/models/tasks_view_filter.dart';

class MockTasksRepository extends Mock implements TasksRepository {}

class FakeTask extends Fake implements Task {}

void main() {
  group('TasksViewBloc', () {
    late TasksRepository tasksRepository;

    const mockTask1 = Task(id: 1, title: 'task 1', body: 'body 1');
    const mockTask2 = Task(id: 2, title: 'task 2', body: 'body 2');
    const mockTasks = [mockTask1, mockTask2];

    setUp(() {
      tasksRepository = MockTasksRepository();

      when(() => tasksRepository.getTasks())
          .thenAnswer((_) => Future.value(mockTasks));
      when(() => tasksRepository.updateTask(any())).thenAnswer((_) async {});
    });

    setUpAll(() {
      registerFallbackValue(FakeTask());
    });

    TasksViewBloc buildBloc() {
      return TasksViewBloc(tasksRepository: tasksRepository);
    }

    group('constructor', () {
      test('works properly', () => expect(buildBloc, returnsNormally));

      test('has correct initial state', () {
        expect(
            buildBloc().state,
            equals(
                const TasksViewState(tasks: [], filter: TasksViewFilter.all)));
      });
    });

    group('TasksViewLoadTask', () {
      blocTest<TasksViewBloc, TasksViewState>(
        'get tasks from repository when called',
        build: buildBloc,
        act: (bloc) => bloc.add(const TasksViewLoadTask()),
        expect: () => const <TasksViewState>[
          TasksViewState(
              tasks: mockTasks,
              filter: TasksViewFilter.all,
              status: TasksViewStatus.success),
        ],
        verify: (bloc) => verify(
          () => tasksRepository.getTasks(),
        ).called(1),
      );
    });

    group(TasksViewCompleteToggled, () {
      blocTest<TasksViewBloc, TasksViewState>(
        'update selected task status',
        build: buildBloc,
        act: (bloc) => bloc.add(
            const TasksViewCompleteToggled(task: mockTask1, isCompleted: true)),
        verify: (bloc) => verify(() => tasksRepository.updateTask(any(
              that: isA<Task>()
                  .having((t) => t.title, 'title', equals(mockTask1.title))
                  .having((t) => t.body, 'body', equals(mockTask1.body))
                  .having((t) => t.isDone, 'isDone', equals(true)),
            ))).called(1),
      );
    });

    group('TasksViewFilterChanged', () {
      blocTest<TasksViewBloc, TasksViewState>(
        'update state when filter changed',
        build: buildBloc,
        act: (bloc) => bloc
            .add(const TasksViewFilterChanged(filter: TasksViewFilter.done)),
        expect: () => const <TasksViewState>[
          TasksViewState(tasks: [], filter: TasksViewFilter.done)
        ],
      );
    });
  });
}
