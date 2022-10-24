import 'package:flutter/material.dart';

class Item {
  final String subject;
  final String link;
  final String body;

  const Item(
      {required this.subject, required this.link, required this.body});
}

class ListItem extends StatelessWidget {
  final List<Item> items;

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
                    subtitle: const Text("タイトルに対する何かの表記"),
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
