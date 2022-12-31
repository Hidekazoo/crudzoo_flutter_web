import 'package:crudzoo_flutter_web/api/tasks.dart';
import 'package:crudzoo_flutter_web/repository/tasks_repository.dart';
import 'tasks_repository_test.mocks.dart';
import 'package:test/test.dart';

import 'package:crudzoo_flutter_web/domain/task.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';


@GenerateNiceMocks([MockSpec<TasksApi>()])
void main() {
  group('tasks_gateway', () {
    test('find_tasks', () async {
      final api = MockTasksApi();
      when(api.fetchTasks()).thenAnswer((_) async =>
      [
        const TasksResponse(
            id: "test_id",
            subject: "title",
            link: "https://example.com",
            body: "body")
      ]);
      final target = TasksGateway(api);
      final actual = await target.findTasks();
      const matcher = [
        Task("test_id", TaskContent("title", "https://example.com", "body"))
      ];
      verify(api.fetchTasks());
      expect(actual, equals(matcher));
    });

    test('create task', () async {
      final api = MockTasksApi();
      when(api.postTask("title", "https://example.com", "body")).thenAnswer((realInvocation) async {
        return const TasksResponse(id:"test_id",subject: "title",link:"https://example.com",body:"body");
      });
      final target = TasksGateway(api);
      final actual = await target.createTask(
          const TaskContent("title", "https://example.com", "body"));

      const matcher = Task(
          "test_id", TaskContent("title", "https://example.com", "body"));
      verify(api.postTask("title", "https://example.com", "body"));
      expect(actual, matcher);
    });
  });
}
