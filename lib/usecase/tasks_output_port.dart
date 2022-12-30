
import '../domain/task.dart';

abstract class TasksOutputPort {
  void setTasks(List<Task> tasks);
}