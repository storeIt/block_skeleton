import 'package:exception/exception.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/base/domain/use_case/params.dart';
import '../../../../core/base/domain/use_case/use_case.dart';
import '../entity/number_ent.dart';
import '../repository/number_repository_i.dart';

class RandomNumberUseCase implements UseCase<NumberEntity, NoParams> {
  final NumberRepositoryI repository;

  RandomNumberUseCase(this.repository);

  @override
  Future<Either<Failure, NumberEntity>> call({NoParams? params}) async {
    return await repository.getRandomNumber();
  }
}
