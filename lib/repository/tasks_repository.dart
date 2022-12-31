import 'package:crudzoo_flutter_web/api/tasks.dart';
import 'package:crudzoo_flutter_web/domain/task.dart';
import 'package:crudzoo_flutter_web/usecase/tasks_input_port.dart';

class TasksGateway implements TasksInputPort {
  final TasksApi tasksApi;

  TasksGateway(this.tasksApi);

  @override
  Future<List<Task>> findTasks() async {
    final tasksResponse = await tasksApi.fetchTasks();
    final List<Task> tasks = tasksResponse
        .map((item) => Task(item.id, TaskContent(item.subject, item.link, item.body)))
        .toList();
    return tasks;
  }

  @override
  Future<Task> createTask(TaskContent content) async {
   final tasksResponse = await tasksApi.postTask(content.subject, content.link, content.body);
   return Task(tasksResponse.id, TaskContent(tasksResponse.subject, tasksResponse.link, tasksResponse.body));
  }
}
