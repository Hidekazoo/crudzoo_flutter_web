

import 'package:crudzoo_flutter_web/domain/task.dart';
import 'package:crudzoo_flutter_web/usecase/tasks_input_port.dart';

class TasksUsecaseImpl implements TasksUsecase {
  final TasksInputPort tasksInputPort;

  const TasksUsecaseImpl(this.tasksInputPort);

  @override
  Future<List<Task>> findTasks() async {
    final tasks = await tasksInputPort.findTasks();
    return tasks;
  }
}

abstract class TasksUsecase {
  Future<List<Task>> findTasks();
}


