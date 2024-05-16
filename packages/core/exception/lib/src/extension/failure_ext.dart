import '../../exception.dart';

/**
 ** Extension for Failure, WIP
 */
extension FailureExt on Failure {
  String failureToMessage() => switch (runtimeType) {
        ServerFailure _ => NetworkConstant.noConnection,
        UnauthorizedFailure _ => NetworkConstant.unauthorized,
        _ => NetworkConstant.unknownException,
      };
}
