

import '../entities/task.dart';

abstract class TasksInputPort {
  Future<List<Task>> findTasks();
}