import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tasks_repository/tasks_repository.dart';
import 'package:todo_app/new_task/bloc/add_task_bloc.dart';

class MockTasksRepository extends Mock implements TasksRepository {}

class FakeTask extends Fake implements Task {}

void main() {
  group('AddTaskBloc', () {
    late TasksRepository tasksRepository;
    setUpAll(() {
      registerFallbackValue(FakeTask());
    });

    setUp(() {
      tasksRepository = MockTasksRepository();
    });

    AddTaskBloc buildBloc() {
      return AddTaskBloc(tasksRepository: tasksRepository);
    }

    group('constructor', () {
      test(
        'work properly',
        () => expect(buildBloc, returnsNormally),
      );

      test('has correct initial state', () {
        expect(
          buildBloc().state,
          equals(const AddTaskState(title: '', body: '')),
        );
      });
    });

    group('AddTaskTitleChanged', () {
      blocTest<AddTaskBloc, AddTaskState>(
        'emit new state when title update',
        build: () => buildBloc(),
        act: (bloc) => bloc.add(const AddTaskTitleChanged('titlechanged')),
        expect: () => const <AddTaskState>[
          AddTaskState(
            title: 'titlechanged',
            body: '',
            status: AddTaskStatus.valid,
          ),
        ],
      );
    });

    group('AddTaskBodyChanged', () {
      blocTest<AddTaskBloc, AddTaskState>(
        'emit new state when body update',
        build: () => buildBloc(),
        act: (bloc) => bloc.add(const AddTaskBodyChanged('bodychanged')),
        expect: () => const <AddTaskState>[
          AddTaskState(
            title: '',
            body: 'bodychanged',
            status: AddTaskStatus.initial,
          ),
        ],
      );
    });

    group('AddTaskSubmitted', () {
      blocTest<AddTaskBloc, AddTaskState>(
        'save to repository when saved',
        setUp: () {
          when(() => tasksRepository.newTask(any())).thenAnswer((_) async {});
        },
        build: buildBloc,
        seed: () => const AddTaskState(title: 'title'),
        act: (bloc) => bloc.add(const AddTaskSubmitted()),
        expect: () => const [
          AddTaskState(
            title: 'title',
            status: AddTaskStatus.success,
          ),
        ],
        verify: (bloc) => verify(
          () => tasksRepository.newTask(any(
              that: isA<Task>()
                  .having((t) => t.title, 'title', equals('title'))
                  .having((t) => t.body, 'body', equals(''))
                  .having((t) => t.isDone, 'isDone', equals(false)))),
        ),
      );
    });
  });
}
