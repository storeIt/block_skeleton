// import 'package:flutter/material.dart';
// import 'package:plantsnap/src/components/buttons.dart';
// import 'package:plantsnap/src/utils/colors.dart';
// import 'package:plantsnap/src/utils/localizations.dart';
// import 'package:styled_widget/styled_widget.dart';
//
// Future<bool?> showConfirmDialog(BuildContext context, {Widget? icon, String? title, String? message}) {
//   return showDialog<bool>(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         insetPadding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 24.0),
//         title: [
//           if (icon != null) icon.padding(bottom: 10),
//           Text(
//             title ?? context.l10n.confirmTitle,
//             textAlign: TextAlign.center,
//             style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: context.colors.error),
//           )
//         ].toColumn(),
//         content: Text(
//           message ?? context.l10n.confirmContent,
//           textAlign: TextAlign.center,
//           style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//         ),
//         actionsAlignment: MainAxisAlignment.center,
//         actionsOverflowAlignment: OverflowBarAlignment.center,
//         actions: [
//           [
//             FilledButton(
//               child: FittedBox(
//                 fit: BoxFit.scaleDown,
//                 child: Text(context.l10n.confirmOk),
//               ),
//               onPressed: () => Navigator.of(context).pop(true),
//             ).fullWidth().danger().expanded(),
//             const SizedBox(width: 10),
//             FilledButton.tonal(
//               child: FittedBox(
//                 fit: BoxFit.scaleDown,
//                 child: Text(context.l10n.confirmCancel),
//               ),
//               onPressed: () => Navigator.of(context).pop(false),
//             ).fullWidth().expanded(),
//           ].toRow(),
//         ],
//       );
//     },
//   );
// }
