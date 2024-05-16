import 'package:exception/exception.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/entity/number_ent.dart';
import '../../domain/repository/number_repository_i.dart';
import '../datasource/local/number_local_data.dart';
import '../datasource/remote/number_remote_data.dart';

class NumberRepository implements NumberRepositoryI {
  final NumberRemoteData remoteDataSource;
  final NumberLocalData localDataSource;

  NumberRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, NumberEntity>> getConcreteNumber(int number) async {
    try {
      final remoteNumber = await remoteDataSource.getConcreteNumber(number);
      localDataSource.cacheNumber(remoteNumber);
      return Right(remoteNumber);
    } catch (e) {
      return Left(
        ServerFailure(
          NetworkConstant.requestError,
          e,
          StackTrace.current,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, NumberEntity>> getRandomNumber() async {
    try {
      final remoteNumber = await remoteDataSource.getRandomNumber();
      localDataSource.cacheNumber(remoteNumber);
      return Right(remoteNumber);
    } catch (e) {
      return Left(
        ServerFailure(
          NetworkConstant.requestError + ' getRandomNumber',
          e,
          StackTrace.current,
        ),
      );
    }
  }
}
