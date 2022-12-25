import 'package:crudzoo_flutter_web/api/tasks.dart';
import 'package:crudzoo_flutter_web/gateway/tasks_gateway.dart';
import 'tasks_gateway_test.mocks.dart';
import 'package:test/test.dart';

import 'package:crudzoo_flutter_web/entities/task.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';


@GenerateNiceMocks([MockSpec<TasksApi>()])
void main() {
  group('tasks_gateway', () {
    test('find_tasks', () async {
      final api = MockTasksApi();
      when(api.fetchTasks()).thenAnswer((realInvocation) async => [
            const TasksResponse(
                subject: "title", link: "https://example.com", body: "body")
          ]);
      final target = TasksGateway(api);
      final actual = await target.findTasks();
      final matcher = [const Task("title", "https://example.com", "body")];
      verify(api.fetchTasks());
      expect(actual, equals(matcher));
    });
  });
}
