
import 'package:crudzoo_flutter_web/domain/task.dart';
import 'package:crudzoo_flutter_web/usecase/tasks_output_port.dart';
import 'package:crudzoo_flutter_web/view/provider/tasks.dart';
import 'package:crudzoo_flutter_web/view/state/tasks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TasksPresenter implements TasksOutputPort {
  TasksPresenter(this.ref) : super();
  final Ref ref;

  static final provider = Provider<TasksPresenter>((ref) => TasksPresenter(ref));

  @override
  void setTasks(List<Task> tasks) {
    final viewTasks = tasks.map((e) => ViewTask(e.id, e.taskContent.subject, e.taskContent.link, e.taskContent.body)).toList();
    final provider = ref.read(tasksProvider.notifier);
    provider.addTasks(viewTasks);
  }
}