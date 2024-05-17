import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/base_bloc/base_bloc.dart';

class AppWidget<T extends BlocBase<BaseState>> extends StatelessWidget {
  AppWidget({required this.childWidget, super.key});

  final Widget childWidget;
  AlertDialog? progressDialog;
  late final BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return BlocConsumer<T, BaseState>(
      listener: (BuildContext context, BaseState state) {
        print('log_tag AppWidget listener: $state');
        if (state.isLoading) {
          print('log_tag ${this.runtimeType} listener isLoading: true');
          showProgressIndicatorIfNotShowing();
        } else {
          hideProgressIndicator();
        }
      },
      builder: (context, state) {
        return childWidget;
      },
    );
  }

  bool showProgressIndicatorIfNotShowing({String? msgKey, String? text}) {
    if (canShowProgressDialog()) {
      showProgressIndicator(msgKey: msgKey, text: text);
      return true;
    }

    return false;
  }

  bool canShowProgressDialog() {
    return progressDialog == null;
  }

  showProgressIndicator({String? msgKey, String? text}) {
    if (progressDialog == null || msgKey != null) {
      String message;
      // if (msgKey != null) {
      //   message = Txt.get(msgKey);
      // } else if (text != null) {
      //   message = text;
      // } else if (FlavorConfig.instance!.msgLoadingKey != null) {
      //   message = Txt.get(FlavorConfig.instance!.msgLoadingKey);
      // } else {
      message = 'Loading...';
      // }
      progressDialog = Dialogs.createProgressDialog(null, message);
    }
    Dialogs.showProgressDialog(_context, progressDialog!);
  }

  hideProgressIndicator() {
    if (progressDialog != null) {
      Navigator.of(_context, rootNavigator: true).pop();
      progressDialog = null;
    }
  }
}
