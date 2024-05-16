import 'package:exception/exception.dart';
import 'package:fpdart/fpdart.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInt(String str) {
    try {
      final integer = int.parse(str);
      if (integer < 0) throw FormatException();
      return Right(integer);
    } on FormatException {
      return Left(InvalidInputFailure('Invalid Input', StackTrace.current));
    }
  }
}
