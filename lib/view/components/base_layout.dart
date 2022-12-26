import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({super.key, required this.title, required this.body});

  final String title;

  final Widget body;

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
                );
              },
            ),
            title: Text(title)),
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
                  }),
            ],
          ),
        ),
        body: Column(
          children: [Center(child: body)],
        ));
  }
}
