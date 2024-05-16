import 'dart:io';

import 'package:flutter/foundation.dart' as foundation;
import 'package:logger/logger.dart';

class Log {
  ///This tags will be set allays in logs as prefix for easy sorting only app
  ///logs
  ///https://plugins.jetbrains.com/plugin/7125-grep-console
  static const String appTag = 'AppLog';
  static const String tagDebug = 'DEBUG'; //''👍';
  static const String tagWarning = 'WARN'; //'🤔';
  static const String tagError = 'ERROR'; //'⚡';
  static const String tagInfo = 'INFO'; //'☘';

  ///This must be set from UI on start
  static bool fromUI = false;

  ///option to print logs in release mode, should be used only for testing releases
  static bool printInRelease = false;

  static final _logger = Logger(
    printer: PrettyPrinter(
      printTime: false,
      methodCount: 0,
    ),
  );

  static Logger? _fileLogger;

  static initFileLogger(
      {File? fileToLog, Future<File> Function(File? currentFile)? getNewFile}) {
    _fileLogger = Logger(
      filter: ProductionFilter(),
      printer: PrettyPrinter(
        printTime: false,
        methodCount: 0,
      ),
    );
  }

  //TODO set live template

  ///This method will print developer's info in logs only if we are in debug
  ///mode
  static d(String log, [String? tag]) {
    printInDebugOnly(
        tag != null ? '$tagDebug $appTag $tag' : '$tagDebug $appTag',
        log,
        Level.debug);
  }

  ///This method will print developer's info in logs only if we are in debug
  ///mode, but will not add to the CrashReporter. This one is save for print passwords or other sensitive information
  /// in the console
  static s(String log, [String? tag]) {
    printInDebugOnly(
        tag != null ? '$tagDebug $appTag $tag' : '$tagDebug $appTag',
        log,
        Level.debug,
        addToCrashReporter: false);
  }

  ///This method will print developer's warning logs only if we are in debug
  ///mode
  static w(String log, [String? tag]) {
    printInDebugOnly(
        tag != null ? '$tagWarning $appTag $tag' : '$tagWarning $appTag',
        log,
        Level.warning);
  }

  static void printInDebugOnly(String tag, String log, Level level,
      {bool addToCrashReporter = true}) {
    if (fromUI && addToCrashReporter) {
      // TODO Petar: implement crash reporter
      // InstanceProvider.getInstance()
      //     ?.crashReporter
      //     ?.log(log, tag); //always save in Crash Reporter
    }

    if (printInRelease || !foundation.kReleaseMode) {
      _print('$tag : $log', level, _logger);
    }

    if (_fileLogger != null && addToCrashReporter) {
      _print('$tag : $log', level, _fileLogger);
    }
  }

  static void _print(String textToLog, Level? level, Logger? logger,
      {dynamic error, StackTrace? stackTrace}) {
    if (logger == null) return;
//    print("${DateTime.now()} $textToLog");

    textToLog = "${DateTime.now()} $textToLog";
    if (level == null) {
      logger.d(textToLog);
      return;
    }
    switch (level) {
      case Level.info:
        logger.i(textToLog);
        break;
      case Level.warning:
        logger.w(textToLog);
        break;
      case Level.error:
        logger.e(textToLog, error, stackTrace);
        break;
      default:
        logger.d(textToLog);
        break;
    }
  }

  ///Use this method to print in logs your error messages.
  static error(String log, {String? tag, dynamic error}) {
    e(log, tag, _fixError(error));
  }

  static _fixError(error) {
    if (error == null) {
      // TODO Petar: switch AppException with appropriate Failure
      // error = AppException(data: "Handled error!");
    } else if (error is! Error) {
      // error = AppException(data: error);
    }
    return error;
  }

  ///Use this method to print in logs your error messages.
  static e(String log, [String? tag, Error? error]) {
    error = _fixError(error);
    if (fromUI) {
      // TODO Petar: implement crash reporter
      // InstanceProvider.getInstance()?.crashReporter?.logError(log, tag, error);
    }

    if (_fileLogger != null) {
      _printError(tag, error, log, _fileLogger);
    }

    if (printInRelease || !foundation.kReleaseMode) {
      _printError(tag, error, log, _logger);
      return true;
    }
  }

  static void _printError(
      String? tag, Error? error, String log, Logger? logger) {
    if (logger == null) return;

    String systemTag = '$tagError $appTag';
    if (tag != null && error != null) {
      _print('$systemTag $tag : $log \n $error', Level.error, logger,
          error: error, stackTrace: error.stackTrace);
    } else if (tag != null) {
      _print('$systemTag $tag : $log', Level.error, logger,
          error: error, stackTrace: error?.stackTrace);
    } else if (error != null) {
      _print('$systemTag : $log \n $error', Level.error, logger,
          error: error, stackTrace: error.stackTrace);
    } else {
      _print('$systemTag : $log', Level.error, logger,
          error: error, stackTrace: error?.stackTrace);
    }
  }

  ///Use this method to print in logs user's information messages.
  static i(String log, [String? tag]) {
    printInDebugOnly(tag != null ? '$tagInfo $appTag $tag' : '$tagInfo $appTag',
        log, Level.info);
  }
}
