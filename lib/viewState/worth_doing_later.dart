
import 'package:crudzoo_flutter_web/components/ListItem.dart';
import 'package:crudzoo_flutter_web/gateway/tasks_gateway.dart';
import 'package:crudzoo_flutter_web/usecase/tasks_usecase.dart';
import 'package:flutter/material.dart';
import 'package:crudzoo_flutter_web/entities/task.dart';
import '../api/tasks.dart';

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
    final api = TasksApi();
    final gateway = TasksGateway(api);
    final usecase = TasksUsecase(gateway);
    tasks = usecase.findTasks();
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
