import 'package:flutter/material.dart';

class FilledButtonWidget extends StatelessWidget {
  static const double borderWidth = 1.0;

  const FilledButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colorScheme.primary,
            border: Border.all(
              color: colorScheme.surface,
              width: borderWidth,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: colorScheme.surface,
                ),
                const SizedBox(width: 8.0),
                Text(
                  'Add Configuration',
                  style: textTheme.bodySmall?.copyWith(color: colorScheme.surface),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
