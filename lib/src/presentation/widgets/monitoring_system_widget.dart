import 'package:flutter/material.dart';
import 'package:sensors_monitoring/src/presentation/widgets/small_widgets/timeline_button_widge.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MonitoringSystemWidget extends StatelessWidget {
  final String name;

  const MonitoringSystemWidget({
    super.key,
    this.name = 'data',
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(
          left: 32.0,
          right: 32.0,
          top: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Monitoring System $name',
              style: textTheme.titleLarge,
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: [
                  Text(
                    'Chart',
                    style: textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      TimelineButtonWidget(onTap: () {}, textInButton: '15min'),
                      TimelineButtonWidget(onTap: () {}, textInButton: '3min'),
                      TimelineButtonWidget(onTap: () {}, textInButton: '3d'),
                      TimelineButtonWidget(onTap: () {}, textInButton: '5d'),
                      TimelineButtonWidget(onTap: () {}, textInButton: '10d'),
                      TimelineButtonWidget(onTap: () {}, textInButton: '1mo'),
                      TimelineButtonWidget(onTap: () {}, textInButton: '3mo'),
                      TimelineButtonWidget(onTap: () {}, textInButton: 'Select Custom'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: SfCartesianChart(),
                  ),
                  Text(
                    'Details',
                    style: textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'data' * 200,
                    style: textTheme.bodyMedium?.copyWith(color: colorScheme.tertiary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
