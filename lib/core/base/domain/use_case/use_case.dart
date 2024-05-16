import 'package:exception/exception.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call({required Params params});
}
