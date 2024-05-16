// import 'package:flutter/material.dart';
//
// class ErrorDialog extends StatelessWidget {
//   final Widget content;
//
//   const ErrorDialog({super.key, required this.content});
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title:
//           Icon(SomeIcon.info, color: context.colors.error, size: 24).center(),
//       content: DefaultTextStyle(
//         textAlign: TextAlign.center,
//         style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//         child: content,
//       ),
//       actionsAlignment: MainAxisAlignment.center,
//       actions: [
//         FilledButton(
//           child: Text(context.localizations.alertOk),
//           onPressed: () => context.pop(),
//         ).fullWidth(minWidth: 115).danger(),
//       ],
//     );
//   }
// }
