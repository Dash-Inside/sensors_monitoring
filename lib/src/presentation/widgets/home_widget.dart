import 'package:flutter/material.dart';
import 'package:sensors_monitoring/src/presentation/widgets/small_widgets/add_sensor_widget.dart';
import 'package:sensors_monitoring/src/presentation/widgets/small_widgets/sensor_widget.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Sensors',
              style:
                  textTheme.bodyMedium?.copyWith(color: colorScheme.secondary),
            ),
            Text(
              'Grapghics',
              style:
                  textTheme.bodyMedium?.copyWith(color: colorScheme.tertiary),
            ),
          ],
        ),
        Wrap(
          spacing: 16.0,
          runSpacing: 16.0,
          children: [
            AddSensorWidget(),
            SensorWidget(
                cardName: 'Sensor A',
                temperature: '100',
                temperatureChange: '5'),
            SensorWidget(
                cardName: 'Sensor B',
                temperature: '100',
                temperatureChange: '5'),
            SensorWidget(
                cardName: 'Sensor C',
                temperature: '100',
                temperatureChange: '5'),
            SensorWidget(
                cardName: 'Sensor D',
                temperature: '100',
                temperatureChange: '5')
          ],
        )
      ],
    );
  }
}
