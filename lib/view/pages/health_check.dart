import 'package:crudzoo_flutter_web/main.dart';
import 'package:crudzoo_flutter_web/view/components/base_layout.dart';
import 'package:flutter/material.dart';

class HealthCheckPage extends StatelessWidget {
  const HealthCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseLayout(
        title: 'Health Check Page', body: MyStatelessWidget());
  }
}
