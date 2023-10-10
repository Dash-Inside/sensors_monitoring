import 'package:flutter/material.dart';
import 'package:sensors_monitoring/src/presentation/controllers/monitoring_drawer_controller.dart';
import 'dart:math';
import 'package:sensors_monitoring/src/presentation/widgets/small_widgets/filled_button_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    MonitoringDrawerController controller = MonitoringDrawerController();

    final ColorScheme colorScheme = Theme.of(context).colorScheme;

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
                            onPressed: controller.onDrawerButtonPressed,
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
                    _DividerWidget(textInDivider: 'Configuration'),
                    Expanded(
                      child: ListView(
                        children: [
                          FilledButtonWidget(),
                        ],
                      ),
                    ),
                    _DividerWidget(textInDivider: 'Other'),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _ButtonWidget(
                            buttonText: 'Settings',
                            icon: Icons.settings_outlined,
                          ),
                          const SizedBox(height: 16.0),
                          _ButtonWidget(
                            buttonText: 'Contact Support',
                            icon: Icons.contact_support_outlined,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: IconButton(
                        onPressed: controller.onDrawerButtonPressed,
                        icon: Icon(
                          Icons.start,
                          color: colorScheme.surface,
                        ),
                      ),
                    ),
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
                        Icons.notifications_outlined,
                        color: colorScheme.surface,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.settings_outlined,
                        color: colorScheme.surface,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8.0,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.contact_support_outlined,
                          color: colorScheme.surface,
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        );
      },
    );
  }
}

class _DividerWidget extends StatelessWidget {
  static const double dividerThickness = 2.0;
  static const double dividerHeight = 0.0;
  final String textInDivider;

  const _DividerWidget({
    required this.textInDivider,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(
              height: dividerHeight,
              thickness: dividerThickness,
              color: colorScheme.surface,
            ),
          ),
        ),
        Text(
          textInDivider,
          style: textTheme.headlineSmall?.copyWith(
            color: colorScheme.surface,
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(
              height: dividerHeight,
              thickness: dividerThickness,
              color: colorScheme.surface,
            ),
          ),
        ),
      ],
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  final String buttonText;
  final IconData icon;
  final void Function()? onTap;

  const _ButtonWidget({
    required this.buttonText,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: colorScheme.surface,
          ),
          const SizedBox(
            width: 16.0,
          ),
          Text(
            buttonText,
            style: textTheme.bodySmall?.copyWith(color: colorScheme.surface),
          ),
        ],
      ),
    );
  }
}
