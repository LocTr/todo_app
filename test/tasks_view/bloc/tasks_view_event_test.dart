import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/tasks_view/bloc/tasks_view_bloc.dart';
import 'package:tasks_repository/tasks_repository.dart';
import 'package:todo_app/tasks_view/models/tasks_view_filter.dart';

void main() {
  group("TasksViewEvent", () {
    const mockTask = Task(id: 1, title: 'task 1', body: 'body 1');

    group('test equality', () {
      test('TasksViewCompleteToggled', () {
        expect(
            const TasksViewCompleteToggled(isCompleted: true, task: mockTask),
            equals(const TasksViewCompleteToggled(
                isCompleted: true, task: mockTask)));
      });

      test('TasksViewLoadTask', () {
        expect(const TasksViewLoadTask(), equals(const TasksViewLoadTask()));
      });

      test('TasksViewFilterChanged', () {
        expect(const TasksViewFilterChanged(filter: TasksViewFilter.all),
            equals(const TasksViewFilterChanged(filter: TasksViewFilter.all)));
      });
    });
  });
}
