import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/base_bloc/base_bloc.dart';

/**
 ** [AppWidget] is the glue between the app logic and the feature business logic.
 ** It wraps the child widget with a BlocConsumer and handles app state changes.
 ** AppWidget is a generic class that takes a BlocBase as a type parameter.
 ** Bloc and Cubit are subclasses of BlocBase so whatever the state management
 ** class is, it can be used with the AppWidget.
 ** It listens to the app states (Loading, Loaded, Dialog, Failure) and shows an
 ** appropriate widget based on the state - loading indicator, dialog, error message, etc.
 ** The [childWidget] is the widget that will be wrapped by the BlocConsumer's builder.
 ** It is the main widget of the feature that will be displayed on the screen and
 ** will be built based on the app or feature state changes.
 *
 ** The AppWidget will have common to all features methods like show and hide a
 ** progress indicator or shimmer effect, show a dialog, snackbar, etc.
 ** At the same time, the wrapped child widget will have its own specific methods
 ** to handle the same as the app state changes.
 *
 ** Example:
 ** when we have a Loading state, which is part of the app states, the AppWidget
 ** will show a loading indicator, but the child widget will have a method to
 ** change a Text widget according to the business logic related to the feature
 ** for the same Loading state.
 *
 ** In short AppWidget is the common part of the app which provides easy way to
 ** handle app states and show appropriate widgets based on the app state changes
 ** and a convenient way to test the app.
 **/
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
