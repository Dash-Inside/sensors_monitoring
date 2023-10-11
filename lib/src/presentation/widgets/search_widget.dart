import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return IconButton(
      onPressed: () {
        final Color transparent = Colors.transparent;

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  16.0,
                ),
              ),
            ),
            surfaceTintColor: transparent,
            clipBehavior: Clip.hardEdge,
            content: _ContentWidget(),
          ),
        );
      },
      icon: Icon(
        Icons.search,
        color: colorScheme.surface,
      ),
    );
  }
}

class _ContentWidget extends StatelessWidget {
  static const containerHeight = 400.0;
  static const containerWidth = 800.0;

  const _ContentWidget();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    final OutlineInputBorder border = OutlineInputBorder(
      borderSide: BorderSide(
        color: colorScheme.primary,
        width: 1.5,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(8.0),
      ),
    );

    return Container(
      height: containerHeight,
      width: containerWidth,
      color: colorScheme.surface,
      child: Column(
        children: [
          TextField(
            cursorColor: colorScheme.primary,
            style: textTheme.headlineLarge?.copyWith(color: colorScheme.secondary),
            decoration: InputDecoration(
              isDense: true,
              isCollapsed: true,
              contentPadding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                top: 8.0,
                bottom: 8.0,
              ),
              enabledBorder: border,
              focusedBorder: border,
              hintText: 'Enter either Configuration or Sensor name',
              hintStyle: textTheme.headlineLarge?.copyWith(color: colorScheme.primary),
              suffix: Padding(
                padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
                child: InkWell(
                  child: Icon(
                    Icons.search,
                    size: 24.0,
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
