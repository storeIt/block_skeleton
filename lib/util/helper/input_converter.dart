import 'package:dartz/dartz.dart';

import '../../core/exception/failure.dart';

// TODO: Could be an extension function to avoid dependency. Leave it this way
//  to show Yanko utils usage and extension functions implemented in the project
class InputConverter {
  Either<Failure, int> stringToUnsignedInt(String str) {
    try {
      final integer = int.parse(str);
      if (integer < 0) throw FormatException();
      return Right(integer);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}
