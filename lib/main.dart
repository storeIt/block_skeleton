import 'dart:async';

import 'package:exception/exception.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:util/helper/logger.dart';

import 'core/app/app_bloc_observer.dart';
import 'core/app/view/app.dart';
import 'util/service/service_locator.dart';

Future<void> main() async {
  final _logger = LoggerHelper();
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await setupLocator();
    FlutterError.onError = (FlutterErrorDetails details) {
      Bloc.observer = TntBlocObserver();

      if (kDebugMode)
        _logger.e(
          NetworkConstant.unknownException,
          details.exception,
          details.stack,
        );
    };

    runApp(const App());
  }, (error, stack) {
    if (kDebugMode) {
      _logger.e('$error', error, stack);
    }
  });
}
