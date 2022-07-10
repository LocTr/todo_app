import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tasks_api/tasks_api.dart';
import 'package:tasks_repository/tasks_repository.dart';

class MockTasksApi extends Mock implements TasksApi {}

class FakeTask extends Fake implements Task {}

void main() {
  group('TasksRepository', () {
    late TasksApi api;

    const mockTask1 = Task(id: 1, title: 'task 1', body: 'body 1');
    const mockTask2 = Task(id: 2, title: 'task 2', body: 'body 2');
    const newTask = Task(id: 3, title: 'task new', body: 'body new');
    const mockTasks = [mockTask1, mockTask2];

    setUpAll(() {
      registerFallbackValue(FakeTask());
    });

    setUp(() {
      api = MockTasksApi();
      when(() => api.getTasks())
          .thenAnswer((invocation) async => Future.value(mockTasks));
      when(() => api.newTask(newTask)).thenAnswer((_) async {});
      when(() => api.deleteTask(newTask.id)).thenAnswer((_) async {});
      when(() => api.clearCompleted()).thenAnswer((_) async {});
      when(() => api.updateTask(newTask)).thenAnswer((_) async {});
    });

    TasksRepository createSubject() => TasksRepository(tasksApi: api);

    group('getTasks', () {
      test('make correct api request', () {
        final subject = createSubject();

        expect(subject.getTasks(), completes);

        verify((() => api.getTasks())).called(1);
      });
    });

    group('newTask', () {
      test('make correct api request', () {
        final subject = createSubject();

        expect(subject.newTask(newTask), completes);

        verify((() => api.newTask(newTask))).called(1);
      });
    });

    group('deleteTask', () {
      test('make correct api request', () {
        final subject = createSubject();

        expect(subject.deleteTask(newTask.id), completes);

        verify((() => api.deleteTask(newTask.id))).called(1);
      });
    });

    group('clearCompleted', () {
      test('make correct api request', () {
        final subject = createSubject();

        expect(subject.clearCompleted(), completes);

        verify((() => api.clearCompleted())).called(1);
      });
    });

    group('updateTask', () {
      test('make correct api request', () {
        final subject = createSubject();

        expect(subject.updateTask(newTask), completes);

        verify((() => api.updateTask(newTask))).called(1);
      });
    });
  });
}
