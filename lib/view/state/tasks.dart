import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@immutable
class ViewTask extends Equatable {
  final String id;
  final String subject;
  final String link;
  final String body;

  const ViewTask(this.id, this.subject, this.link, this.body);

  ViewTask copyWith({String? id, String? subject, String? link, String? body}) {
    return ViewTask(id ?? this.id, subject ?? this.subject, link ?? this.link,
        body ?? this.body);
  }

  @override
  List<Object?> get props => [id, subject, link, body];
}

class TasksNotifier extends StateNotifier<List<ViewTask>> {
  TasksNotifier({Key? key}) : super([]);

  void addTask(ViewTask task) {
    state = [...state, task];
  }

  void addTasks(List<ViewTask> tasks) {
    state = [...state, ...tasks];
  }

  List<ViewTask> getTasks() {
    return state;
  }
}

// class TaskWidget extends StatefulWidget {
//   const TaskWidget({super.key});
//
//   @override
//   void initState() {
//
//   }
//
//   @override
//   State<StatefulWidget> createState() {
//     return TasksState();
//   }
// }
//
// class TasksState extends State<TaskWidget> {
//   late Future<List<Task>> tasks;
//
//   @override
//   void initState() {
//     super.initState();
//     tasks = tasksUsecase.loadTasks();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: tasks,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return ListItem(
//                 items: snapshot.data!
//             );
//           }
//           return const CircularProgressIndicator();
//         });
//   }
// }
