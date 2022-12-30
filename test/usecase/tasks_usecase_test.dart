
import 'package:crudzoo_flutter_web/domain/task.dart';
import 'package:crudzoo_flutter_web/usecase/tasks_output_port.dart';
import 'tasks_usecase_test.mocks.dart';
import 'package:crudzoo_flutter_web/usecase/tasks_input_port.dart';
import 'package:crudzoo_flutter_web/usecase/tasks_usecase.dart';
import 'package:test/test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<Task>(), MockSpec<TasksInputPort>(), MockSpec<TasksOutputPort>()])

void main() {
  group('tasks_usecase', () {
    test('load tasks', () async {
      final inputPort = MockTasksInputPort();
      final outputPort = MockTasksOutputPort();
      final target = TasksUsecaseImpl(inputPort, outputPort);
      final tasks = MockTask();
      when(inputPort.findTasks()).thenAnswer((_) async => [tasks]);

      await target.loadTasks();
      verify(inputPort.findTasks());
      verify(outputPort.setTasks([tasks]));
    });
  });

}