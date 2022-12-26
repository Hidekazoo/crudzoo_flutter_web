import 'package:crudzoo_flutter_web/view/components/base_layout.dart';
import 'package:crudzoo_flutter_web/view/state/tasks.dart';
import 'package:flutter/material.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseLayout(title: 'Tasks Page', body: TaskWidget());
  }
}
