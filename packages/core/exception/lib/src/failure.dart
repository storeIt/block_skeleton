import 'package:flutter/foundation.dart';
import 'package:util/util.dart';

import 'exception_constant.dart';

sealed class Failure implements Exception {
  late String message;
  late String failureType;
  final LoggerHelper _logger;
  final Object? error;
  final StackTrace? stackTrace;

  Failure({
    required this.message,
    required this.failureType,
    this.error,
    this.stackTrace,
  }) : _logger = LoggerHelper() {
    stackTrace ?? StackTrace.current;
    if (kDebugMode) _logError();
  }

  void _logError() {
    _logger.e('$failureType, $message', error, stackTrace);
  }

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  ServerFailure(String message, Object error, StackTrace? stack)
      : super(
          message: message,
          failureType: (ServerFailure).toString(),
          error: error,
          stackTrace: stack,
        );
}

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure(Object error, StackTrace? stack)
      : super(
          message: NetworkConstant.unauthorized,
          failureType: (UnauthorizedFailure).toString(),
          error: error,
          stackTrace: stack,
        );
}

class FormatFailure extends Failure {
  FormatFailure(Object error, StackTrace? stack)
      : super(
          message: NetworkConstant.formatException,
          failureType: (FormatFailure).toString(),
          error: error,
          stackTrace: stack,
        );
}

class ConnectionFailure extends Failure {
  ConnectionFailure(Object error, StackTrace? stack)
      : super(
          message: NetworkConstant.noConnection,
          failureType: (ConnectionFailure).toString(),
          error: error,
          stackTrace: stack,
        );
}

class UnhandledFailure extends Failure {
  UnhandledFailure(Object error, StackTrace? stack)
      : super(
          message: NetworkConstant.unhandledException,
          failureType: (UnhandledFailure).toString(),
          error: error,
          stackTrace: stack,
        );
}

class CacheFailure extends Failure {
  CacheFailure(String message, Object error, StackTrace? stack)
      : super(
          message: message,
          failureType: (ServerFailure).toString(),
          error: error,
          stackTrace: stack,
        );
}

class InvalidInputFailure extends Failure {
  InvalidInputFailure(String message, StackTrace? stack)
      : super(
          message: message,
          failureType: (ServerFailure).toString(),
          stackTrace: stack,
        );
}
