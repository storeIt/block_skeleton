import 'package:exception/exception.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/base/domain/use_case/params.dart';
import '../../../../core/base/domain/use_case/use_case.dart';
import '../entity/number_ent.dart';
import '../repository/number_repository_i.dart';

class ConcreteNumberUseCase implements UseCase<NumberEntity, Params> {
  final NumberRepositoryI repository;

  ConcreteNumberUseCase(this.repository);

  @override
  Future<Either<Failure, NumberEntity>> call({required Params params}) async {
    await Future.delayed(const Duration(seconds: 2));
    return await repository.getConcreteNumber(params.params as int);
  }
}
