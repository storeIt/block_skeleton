import 'package:dartz/dartz.dart';

import '../../../../core/base/data/repository/number_trivia_repository_i.dart';
import '../../../../core/base/domain/use_case/params.dart';
import '../../../../core/base/domain/use_case/use_case.dart';
import '../../../../core/exception/failure.dart';
import '../entity/number_trivia.dart';

class ConcreteNumberTriviaUseCase
    implements UseCase<NumberTriviaEntity, Params> {
  final NumberTriviaRepositoryI repository;

  ConcreteNumberTriviaUseCase(this.repository);

  // TODO: Create documentation for call method. Check Callable class.
  @override
  Future<Either<Failure, NumberTriviaEntity>> call({Params? params}) async {
    return await repository.getConcreteNumberTrivia(params as int);
  }
}
