

import 'package:crudzoo_flutter_web/domain/task.dart';
import 'package:crudzoo_flutter_web/usecase/tasks_input_port.dart';
import 'package:crudzoo_flutter_web/usecase/tasks_output_port.dart';

class TasksUsecaseImpl implements TasksUsecase {
  final TasksInputPort tasksInputPort;
  final TasksOutputPort tasksOutputPort;

  const TasksUsecaseImpl(this.tasksInputPort, this.tasksOutputPort);

  @override
  Future<void> loadTasks() async {
    final tasks = await tasksInputPort.findTasks();
    tasksOutputPort.setTasks(tasks);
  }
}

abstract class TasksUsecase {
  Future<void> loadTasks();
}

