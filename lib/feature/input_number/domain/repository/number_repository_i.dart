import 'package:exception/exception.dart';
import 'package:fpdart/fpdart.dart';
import '../entity/number_ent.dart';

abstract interface class NumberRepositoryI {
  Future<Either<Failure, NumberEntity>> getConcreteNumber(int number);

  Future<Either<Failure, NumberEntity>> getRandomNumber();
}
