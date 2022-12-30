import 'package:crudzoo_flutter_web/view/components/ListItem.dart';
import 'package:crudzoo_flutter_web/view/provider/tasks.dart';
import 'package:crudzoo_flutter_web/view/state/tasks.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskListWidget extends ConsumerWidget {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ViewTask> tasks = ref.watch(tasksProvider);
    return Column(
      children: [
        ListItem(items: tasks),
        Center(
            child: FloatingActionButton(
          onPressed: () => {},
          child: const Icon(Icons.add),
        ))
      ],
    );
  }
}
