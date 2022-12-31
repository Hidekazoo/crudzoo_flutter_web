import 'package:crudzoo_flutter_web/domain/task.dart';
import 'package:crudzoo_flutter_web/view/state/tasks.dart';
import 'package:flutter/material.dart';

class Item {
  final String id;
  final String subject;
  final String link;
  final String body;

  const Item(
      {required this.id, required this.subject, required this.link, required this.body});
}

class ListItem extends StatelessWidget {
  final List<ViewTask> items;

  const ListItem({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return (ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: items
            .map((element) => Card(
                  child: ExpansionTile(
                    title: Text(element.subject),
                    subtitle: const Text("サブタイトル"),
                    leading: const Icon(Icons.import_contacts_sharp),
                    controlAffinity: ListTileControlAffinity.trailing,
                    children: <Widget>[
                      Text(element.link),
                      ListTile(title: Text(element.body)),
                    ],
                  ),
                ))
            .toList()));
  }
}
