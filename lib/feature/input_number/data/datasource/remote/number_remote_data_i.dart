import '../../model/number_model.dart';

abstract interface class NumberRemoteDataI {
  /// Calls the http://numbersapi.com/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<NumberModel> getConcreteNumber(int number);

  /// Calls the http://numbersapi.com/random
  ///
  /// Throws a [ServerException] for all error codes
  Future<NumberModel> getRandomNumber();
}
