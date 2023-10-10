import 'package:flutter/material.dart';

class SensorWidget extends StatelessWidget {
  static const double containerHeight = 200.0;
  static const double containerWidth = 280.0;
  final String cardName;
  final String temperature;
  final String temperatureChange;
  final void Function()? onTap;

  const SensorWidget({
    super.key,
    required this.cardName,
    required this.temperature,
    required this.temperatureChange,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: containerHeight,
        width: containerWidth,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(3, 2),
              blurRadius: 5,
              color: Colors.grey,
            ),
          ],
          color: colorScheme.surface,
          borderRadius: const BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cardName,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.secondary,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Placeholder(),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.keyboard_double_arrow_up,
                  size: 16.0,
                  color: Colors.green,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '$temperature°C',
                    style: textTheme.headlineMedium?.copyWith(
                      color: colorScheme.secondary,
                    ),
                  ),
                ),
                Text(
                  '+$temperatureChange°C',
                  style: textTheme.headlineMedium?.copyWith(
                    color: colorScheme.tertiary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
