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
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                  // tooltip:
                  //     MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            title: const Text('Tasks')),
        drawer: Drawer(),
        body: Column(
          children: const [Center(child: TaskWidget())],
        ));
  }
}
