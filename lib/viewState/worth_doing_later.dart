

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

  late Future<List<TasksResponse>> worthDoingLaterResponse;

  @override
  void initState() {
    super.initState();
    worthDoingLaterResponse = fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: worthDoingLaterResponse,
        builder: (context,snapshot) {
      if (snapshot.hasData) {
        return ListItem(items: snapshot.data!.map((e) => Item(title: e.subject, link: e.link, supplement: e.body)).toList());
      }
      return const CircularProgressIndicator();
    });
  }

}