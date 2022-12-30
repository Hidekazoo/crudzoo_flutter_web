import 'package:crudzoo_flutter_web/view/components/base_layout.dart';
import 'package:crudzoo_flutter_web/view/components/task_list.dart';
import 'package:crudzoo_flutter_web/view/provider/tasks.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskPageView extends ConsumerStatefulWidget {
  const TaskPageView({Key? key}) : super(key: key);

  @override
  TasksPage createState() {
    return TasksPage();
  }
}

class TasksPage extends ConsumerState<TaskPageView> {

  @override
  void initState() {
    super.initState();
    ref.read(tasksUsecaseProvider).loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return const BaseLayout(title: 'Tasks Page', body: TaskListWidget());
  }
}

