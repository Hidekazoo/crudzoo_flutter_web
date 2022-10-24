import 'package:crudzoo_flutter_web/api/tasks.dart';
import 'package:crudzoo_flutter_web/components/ListItem.dart';
import 'package:flutter/material.dart';

class WorthDoingLater extends StatefulWidget {
  const WorthDoingLater({super.key});

  @override
  State<StatefulWidget> createState() {
    return WorthDoingLaterState();
  }
}

class WorthDoingLaterState extends State<WorthDoingLater> {
  late Future<List<TasksResponse>> tasksResponse;

  @override
  void initState() {
    super.initState();
    tasksResponse = fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: tasksResponse,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListItem(
                items: snapshot.data!
                    .map((e) =>
                        Item(subject: e.subject, link: e.link, body: e.body))
                    .toList());
          }
          return const CircularProgressIndicator();
        });
  }
}
