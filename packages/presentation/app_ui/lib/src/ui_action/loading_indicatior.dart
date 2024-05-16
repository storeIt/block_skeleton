// import 'package:flutter/material.dart';
//
// mixin LoadingIndicator<T extends StatefulWidget> on State<T> {
//   ValueNotifier<bool> isVisible = ValueNotifier<bool>(false);
//   OverlayEntry? entry;
//
//   void hideLoading() {
//     isVisible.value = false;
//     Future.delayed(UiConstants.animationDuration, () {
//       entry?.remove();
//       entry = null;
//     });
//   }
//
//   void showLoading() {
//     entry = OverlayEntry(
//       builder: (context) {
//         return ValueListenableBuilder<bool>(
//           valueListenable: isVisible,
//           builder: (context, value, child) {
//             return AnimatedOpacity(
//               opacity: value ? 1 : 0,
//               duration: UiConstants.animationDuration,
//               curve: UiConstants.animationCurve,
//               child: Container(
//                 width: context.width,
//                 height: context.height,
//                 color: Colors.black.withOpacity(0.8),
//                 child: const Center(
//                   child: CircularProgressIndicator.adaptive(),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//     Overlay.of(context).insert(entry!);
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       isVisible.value = true;
//     });
//   }
// }
