import 'package:flutter/material.dart';
import 'package:sensors_monitoring/src/presentation/controllers/monitoring_drawer_controller.dart';
import 'dart:math';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    MonitoringDrawerController controller = MonitoringDrawerController();

    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final double width = controller.isOpen ? 350 : 60;

        return Container(
          width: width,
          decoration: BoxDecoration(
            color: colorScheme.primary,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            ),
          ),
          child: Builder(
            builder: (context) {
              if (controller.isOpen) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              color: colorScheme.surface,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications_none,
                              color: colorScheme.surface,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Transform.rotate(
                              angle: 180 * pi / 180,
                              child: Icon(
                                Icons.start,
                                color: colorScheme.surface,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Divider(
                              height: 0.0,
                              thickness: 2.0,
                              color: colorScheme.surface,
                            ),
                          ),
                        ),
                        Text(
                          'Configurations',
                          style: textTheme.headlineSmall?.copyWith(
                            color: colorScheme.surface,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Divider(
                              height: 0.0,
                              thickness: 2.0,
                              color: colorScheme.surface,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView(),
                    ),
                  ],
                );
              } else {
                return Placeholder();
              }
            },
          ),
        );
      },
    );
  }
}
