// ignore_for_file: public_member_api_docs

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class DialogCommon extends StatefulWidget implements AppDialogI {
  const DialogCommon(this.args, {super.key});

  final DialogArgsCommon? args;

  @override
  State<DialogCommon> createState() => _DialogCommonState();
}

class _DialogCommonState extends State<DialogCommon> {
  @override
  Widget build(BuildContext context) {
    // return some kind of a dialog here
    return AlertDialog(
      title: const Text('Title'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            // Text('This is a demo alert dialog.'),
            Text(widget.args!.title),
            // Text('Would you like to approve of this message?'),
            Text(widget.args!.message),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Approve'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

Future<void> showDialogCommon({
  required BuildContext context,
  required DialogArgsCommon args,
}) async =>
    showGeneralDialog(
      context: context,
      pageBuilder: (_, __, ___) => DialogCommon(args),
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: const Offset(0, 1), end: Offset.zero).animate(anim1),
          child: child,
        );
      },
    );
