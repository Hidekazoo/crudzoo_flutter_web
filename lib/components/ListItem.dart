import 'package:flutter/material.dart';

class Item {
  final String title;
  final String link;
  final String supplement;

  const Item(
      {required this.title, required this.link, required this.supplement});
}

class ListItem extends StatelessWidget {
  final List<Item> items;

  const ListItem({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return (ListView(
        children: items
            .map((element) => Card(
                  child: ExpansionTile(
                    title: Text(element.title),
                    subtitle: const Text("タイトルに対する何かの表記"),
                    leading: const Icon(Icons.import_contacts_sharp),
                    controlAffinity: ListTileControlAffinity.trailing,
                    children: <Widget>[
                      Text(element.link),
                      ListTile(title: Text(element.supplement)),
                    ],
                  ),
                ))
            .toList()));
  }
}
