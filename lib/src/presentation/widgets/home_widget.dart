import 'package:flutter/material.dart';
import 'package:sensors_monitoring/src/presentation/widgets/small_widgets/add_sensor_widget.dart';
import 'package:sensors_monitoring/src/presentation/widgets/small_widgets/sensor_widget.dart';

class HomeWidget extends StatelessWidget {
  static const double spacing = 16.0;

  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 64.0,
              top: 16.0,
              bottom: 16.0,
            ),
            child: Row(
              children: [
                Text(
                  'Sensors',
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.secondary,
                  ),
                ),
                const SizedBox(width: 16.0),
                Text(
                  'Graphics',
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.tertiary,
                  ),
                ),
              ],
            ),
          ),
          Wrap(
            spacing: spacing,
            runSpacing: spacing,
            children: [
              AddSensorWidget(),
              SensorWidget(cardName: 'Sensor A', temperature: '100', temperatureChange: '5'),
              SensorWidget(cardName: 'Sensor B', temperature: '100', temperatureChange: '5'),
              SensorWidget(cardName: 'Sensor C', temperature: '100', temperatureChange: '5'),
              SensorWidget(cardName: 'Sensor D', temperature: '100', temperatureChange: '5'),
            ],
          ),
        ],
      ),
    );
  }
}
