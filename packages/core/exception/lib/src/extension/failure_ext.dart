import '../../core/constant/exception_constant.dart';
import '../../core/exception/failure.dart';

extension FailureExt on Failure {
  String failureToMessage() {
    switch (runtimeType) {
      case ServerFailure:
        return ExceptionConstant.serverFailure;
      case CacheFailure:
        return ExceptionConstant.cacheFailure;
      default:
        return 'Unexpected Error';
    }
  }
}
