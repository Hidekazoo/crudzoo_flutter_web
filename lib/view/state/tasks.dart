
import 'package:crudzoo_flutter_web/container.dart';
import 'package:crudzoo_flutter_web/view/components/ListItem.dart';
import 'package:flutter/material.dart';
import 'package:crudzoo_flutter_web/entities/task.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return TasksState();
  }
}

class TasksState extends State<TaskWidget> {
  late Future<List<Task>> tasks;

  @override
  void initState() {
    super.initState();
    tasks = tasksUsecase.findTasks();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: tasks,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListItem(
                items: snapshot.data!
            );
          }
          return const CircularProgressIndicator();
        });
  }
}
