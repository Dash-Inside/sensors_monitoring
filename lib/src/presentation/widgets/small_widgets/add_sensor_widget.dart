import 'package:flutter/material.dart';

class AddSensorWidget extends StatelessWidget {
  final void Function()? onTap;

  const AddSensorWidget({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 200.0,
        width: 280.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            const BoxShadow(
              offset: Offset(3, 2),
              blurRadius: 5,
              color: Colors.grey,
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.add),
            Text(
              'Add Sensor',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
