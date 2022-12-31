

import 'package:crudzoo_flutter_web/view/components/add_task.dart';
import 'package:crudzoo_flutter_web/view/components/base_layout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(title: 'Home', body: AddTaskForm());
  }

}