

import 'package:crudzoo_flutter_web/view/state/tasks.dart';
import 'package:flutter/material.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(onPressed: () {}, icon: const Icon(Icons.menu));
            },
          ),
          title: const Text('Tasks')),
      body: Column(children: const [
        Center(child: TaskWidget())
      ],)
    );
  }
}