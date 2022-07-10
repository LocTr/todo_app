import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/new_task/bloc/add_task_bloc.dart';

void main() {
  group('AddTaskEvent', () {
    group('test equality', () {
      test('AddTaskTitleChanged', () {
        expect(const AddTaskTitleChanged('title'),
            equals(const AddTaskTitleChanged('title')));
      });

      test('AddTaskBodyChanged', () {
        expect(
            const AddTaskBodyChanged('body'), const AddTaskBodyChanged('body'));
      });

      test('AddTaskSubmitted', () {
        expect(const AddTaskSubmitted(), const AddTaskSubmitted());
      });
    });
  });
}
