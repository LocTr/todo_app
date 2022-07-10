import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/new_task/bloc/add_task_bloc.dart';

void main() {
  group('AddTaskState', () {
    AddTaskState createSubject({
      String title = 'title',
      String body = 'body',
    }) {
      return AddTaskState(title: title, body: body);
    }

    test('test object equality', () {
      expect(createSubject(), equals(createSubject()));
    });

    group('copyWith', () {
      test('return same object if no argument provided', () {
        expect(createSubject().copyWith(), equals(createSubject()));
      });
    });

    test('return same object if null provided', () {
      expect(
          createSubject().copyWith(
            body: null,
            status: null,
            title: null,
          ),
          equals(createSubject()));
    });

    test('return same object if null provided', () {
      expect(
          createSubject().copyWith(
            body: null,
            status: null,
            title: null,
          ),
          equals(createSubject()));
    });

    test('replace all', () {
      expect(
          createSubject().copyWith(
            body: 'replaced body',
            title: 'replaced title',
            status: AddTaskStatus.success,
          ),
          equals(const AddTaskState(
            body: 'replaced body',
            title: 'replaced title',
            status: AddTaskStatus.success,
          )));
    });
  });
}
