// import 'package:flutter/material.dart';

// class SearchWidget extends StatelessWidget {
//   const SearchWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final ColorScheme colorScheme = Theme.of(context).colorScheme;

//     return IconButton(
//       onPressed: () {
//         final Color transparent = Colors.transparent;

//         showDialog(
//           context: context,
//           builder: (_) => Dialog(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(16.0),
//               ),
//             ),
//             backgroundColor: colorScheme.surface,
//             surfaceTintColor: transparent,
//             clipBehavior: Clip.hardEdge,
//             child: _ContentWidget(),
//           ),
//         );
//       },
//       icon: Icon(
//         Icons.search,
//         color: colorScheme.surface,
//       ),
//     );
//   }
// }
