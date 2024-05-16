import 'package:dartz/dartz.dart';

import '../../../exception/failure.dart';

abstract interface class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call({Params params});
}
