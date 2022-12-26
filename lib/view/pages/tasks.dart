import 'package:crudzoo_flutter_web/main.dart';
import 'package:crudzoo_flutter_web/view/state/tasks.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        drawer: Drawer(
          child: ListView(
            children: [
              // Builder(builder: (BuildContext context) {
              //   return
                  ListTile(
                    title: const Text('Tasks'),
                    onTap: () {
                      context.go('/tasks');
                      // Navigator.push(context, MaterialPageRoute(
                      //     builder: (context) => const TasksPage()));
                    }),
              // }),
              ListTile(
                  title: const Text('Health Checks'),
                  onTap: () {
                    context.go('/health_check');
                    // Navigator.push(context, MaterialPageRoute(
                    //     builder: (context) => const SecondRoute()));
                  }
              ),
            ],
          ),
        ),
        body: Column(
          children: const [Center(child: TaskWidget())],
        ));
  }
}
