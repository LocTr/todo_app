import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_tasks_api/hive_tasks_api.dart';
import 'package:tasks_api/tasks_api.dart';

void main() async {
  Hive.init('test/hivedb');
  Box box = await Hive.openBox('testTasksBox');
  TasksApi api = HiveTasksApi(dataBox: box);
  //init value
  const initialTasks = [
    Task(
      id: 0,
      title: 'test object 0',
      body: 'test object body 0',
      isDone: false,
    ),
    Task(
      id: 1,
      title: 'test object 1',
      body: 'test object 1',
      isDone: false,
    ),
    Task(
      id: 2,
      title: 'test object 2',
      body: 'test object body 2',
      isDone: true,
    ),
  ];

  group('CRUD hive', () {
    setUp(() async {
      for (var task in initialTasks) {
        await api.newTask(task);
      }
    });

    tearDown(() async {
      await api.deleteAllTask();
    });

    test('read initial', () async {
      var tasks = await api.getTasks();
      expect(tasks.length, equals(3));

      expect(tasks[0], equals(initialTasks[0]));
      expect(tasks[1], equals(initialTasks[1]));
      expect(tasks[2], equals(initialTasks[2]));
    });

    test('Add new tasks', () async {
      const newTask = Task(
        title: 'new test object',
        body: 'new test object',
        isDone: false,
      );

      await api.newTask(newTask);
      final tasks = await api.getTasks();
      expect(tasks.length, equals(4));

      expect(tasks.last.title, newTask.title);
      expect(tasks.last.body, newTask.body);
      expect(tasks.last.isDone, newTask.isDone);
    });

    test('update last task', () async {
      var tasks = await api.getTasks();

      const expectedTitle = 'Test update title';
      const expectedBody = 'Test update body';
      const expectedIsDone = true;

      await api.updateTask(tasks.last.copyWith(
        title: expectedTitle,
        body: expectedBody,
        isDone: expectedIsDone,
      ));
      tasks = await api.getTasks();
      expect(tasks.length, equals(3));

      expect(tasks.last.title, expectedTitle);
      expect(tasks.last.body, expectedBody);
      expect(tasks.last.isDone, expectedIsDone);
    });

    test('delete second task', () async {
      await api.deleteTask(1);
      var tasks = await api.getTasks();

      expect(tasks.length, 2);

      expect(tasks[0].title, initialTasks[0].title);
      expect(tasks[0].body, initialTasks[0].body);
      expect(tasks[0].isDone, initialTasks[0].isDone);

      expect(tasks[1].title, initialTasks[2].title);
      expect(tasks[1].body, initialTasks[2].body);
      expect(tasks[1].isDone, initialTasks[2].isDone);
    });

    test('Remove all tasks', () async {
      await api.deleteAllTask();
      expect(box.values, isEmpty);
    });
  });
}
