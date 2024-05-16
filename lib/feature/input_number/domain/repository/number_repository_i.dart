import 'package:fpdart/fpdart.dart';

import '../../../../core/exception/failure.dart';
import '../../domain/entity/number_ent.dart';

abstract interface class NumberRepositoryI {
  Future<Either<Failure, NumberEntity>> getConcreteNumber(int number);

  Future<Either<Failure, NumberEntity>> getRandomNumber();
}
