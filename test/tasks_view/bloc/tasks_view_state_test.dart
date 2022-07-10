import 'package:flutter_test/flutter_test.dart';
import 'package:tasks_api/models/task.dart';
import 'package:todo_app/tasks_view/bloc/tasks_view_bloc.dart';
import 'package:todo_app/tasks_view/models/tasks_view_filter.dart';

void main() {
  const mockTask1 = Task(id: 1, title: 'task 1', body: 'body 1');
  const mockTask2 = Task(id: 2, title: 'task 2', body: 'body 2');
  const mockTasks = [mockTask1, mockTask2];

  group('TasksViewState', () {
    TasksViewState createSubject({
      TasksViewFilter filter = TasksViewFilter.all,
      List<Task> tasks = const [],
    }) {
      return TasksViewState(
        filter: filter,
        tasks: tasks,
      );
    }

    test('test object equality', () {
      expect(createSubject(), equals(createSubject()));
    });

    test('filteredTask return filtered task', () {
      expect(
        createSubject(tasks: mockTasks, filter: TasksViewFilter.todo)
            .filteredTasks,
        equals(mockTasks.where((task) => !task.isDone).toList()),
      );
    });

    group('copyWith', () {
      test('return same object if no argument provided', () {
        expect(createSubject().copyWith(), equals(createSubject()));
      });
    });

    test('return the same object if null provided', () {
      expect(createSubject().copyWith(tasks: null, filter: null),
          equals(createSubject()));
    });

    test('replace all', () {
      expect(
          createSubject().copyWith(
            filter: TasksViewFilter.done,
            tasks: [mockTask1],
          ),
          equals(
            const TasksViewState(
              filter: TasksViewFilter.done,
              tasks: [mockTask1],
            ),
          ));
    });
  });
}
