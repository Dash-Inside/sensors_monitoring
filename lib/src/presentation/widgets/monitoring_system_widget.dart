import 'package:flutter/material.dart';
import 'package:sensors_monitoring/src/presentation/widgets/small_widgets/timeline_button_widge.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MonitoryngSystemWidget extends StatelessWidget {
  final String name;

  const MonitoryngSystemWidget({
    super.key,
    this.name = 'data',
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

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
            Padding(
              padding: const EdgeInsets.only(
                bottom: 8.0,
                top: 16.0,
              ),
              child: Text(
                'Chart',
                style: textTheme.titleMedium,
              ),
            ),
            Row(
              children: [
                TimelineButtonWidget(onTap: () {}, textInButton: '15min'),
                TimelineButtonWidget(onTap: () {}, textInButton: '3min'),
                TimelineButtonWidget(onTap: () {}, textInButton: '3d'),
                TimelineButtonWidget(onTap: () {}, textInButton: '5d'),
                TimelineButtonWidget(onTap: () {}, textInButton: '10d'),
                TimelineButtonWidget(onTap: () {}, textInButton: '1m'),
                TimelineButtonWidget(onTap: () {}, textInButton: '3m'),
                TimelineButtonWidget(onTap: () {}, textInButton: 'Select Custom'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SfCartesianChart(),
            ),
          ],
        ),
      ),
    );
  }
}
