
import 'package:crudzoo_flutter_web/domain/task.dart';
import 'tasks_usecase_test.mocks.dart';
import 'package:crudzoo_flutter_web/usecase/tasks_input_port.dart';
import 'package:crudzoo_flutter_web/usecase/tasks_usecase.dart';
import 'package:test/test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<Task>(), MockSpec<TasksInputPort>()])

void main() {
  group('tasks_usecase', () {
    test('find tasks', () async {
      final inputPort = MockTasksInputPort();
      final target = TasksUsecaseImpl(inputPort);
      final tasks = MockTask();
      when(inputPort.findTasks()).thenAnswer((_) async => [tasks]);

      final actual = await target.findTasks();
      verify(inputPort.findTasks());
      expect(actual, equals([tasks]));
    });
  });

}