import 'package:flutter/material.dart';

class TimelineButtonWidget extends StatefulWidget {
  final String textInButton;
  final void Function() onTap;

  const TimelineButtonWidget({
    super.key,
    required this.onTap,
    this.textInButton = 'data',
  });

  @override
  State<TimelineButtonWidget> createState() => _TimelineButtonWidgetState();
}

class _TimelineButtonWidgetState extends State<TimelineButtonWidget> {
  bool isButtonPressed = false;

  Color getButtonBorderColor() {
    return isButtonPressed ? Colors.transparent : Theme.of(context).colorScheme.primary;
  }

  Color getButtonColor() {
    return isButtonPressed ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.surface;
  }

  Color getTextColorInButton() {
    return isButtonPressed ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.secondary;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    void onButtonTap() {
      setState(() {
        isButtonPressed = !isButtonPressed;
      });

      widget.onTap();
    }

    return Row(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: onButtonTap,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
              border: Border.all(
                color: getButtonBorderColor(),
              ),
              color: getButtonColor(),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 12.0,
              ),
              child: Text(
                widget.textInButton,
                style: textTheme.headlineMedium?.copyWith(
                  color: getTextColorInButton(),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8.0),
      ],
    );
  }
}
