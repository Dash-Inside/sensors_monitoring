import 'package:flutter/material.dart';
import 'package:sensors_monitoring/src/presentation/widgets/drawer_widget.dart';
import 'package:sensors_monitoring/src/presentation/widgets/home_widget.dart';
import 'package:sensors_monitoring/src/presentation/widgets/monitoring_system_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Center(
        child: Row(
          children: [
            DrawerWidget(),
            // HomeWidget(),
            MonitoryngSystemWidget(),
          ],
        ),
      ),
    );
  }
}
