import 'package:flutter/material.dart';

class SearchDialog extends StatelessWidget {
  const SearchDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      backgroundColor: colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      child: _ContentWidget(),
    );
  }
}

class _ContentWidget extends StatelessWidget {
  static const containerHeight = 400.0;
  static const containerWidth = 800.0;

  final void Function()? onSearchIconTap;

  const _ContentWidget({
    this.onSearchIconTap,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      color: colorScheme.surface,
      height: containerHeight,
      width: containerWidth,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              border: Border.all(
                color: colorScheme.primary,
                width: 1.0,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: textTheme.bodyMedium,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Enter smth..',
                      hintStyle: textTheme.bodyMedium?.copyWith(height: -0.4),
                    ),
                  ),
                ),
                InkWell(
                  onTap: onSearchIconTap,
                  child: Icon(Icons.search),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (_, __) {
                return InkWell(
                  //TODO: Add on Sensor search widget tap event
                  onTap: () => null,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      bottom: 8.0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Config T > Sensor T',
                          style: textTheme.bodySmall,
                        ),
                        Spacer(),
                        Icon(Icons.arrow_right)
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
