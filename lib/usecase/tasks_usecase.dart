

import 'package:crudzoo_flutter_web/entities/task.dart';
import 'package:crudzoo_flutter_web/usecase/tasks_input_port.dart';

class TasksUsecase {
  final TasksInputPort tasksInputPort;

  const TasksUsecase(this.tasksInputPort);

  Future<List<Task>> findTasks() async {
    final tasks = await tasksInputPort.findTasks();
    return tasks;
  }
}


