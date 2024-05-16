import 'package:dartz/dartz.dart';

import '../../../../core/base/data/repository/number_trivia_repository_i.dart';
import '../../../../core/base/domain/use_case/params.dart';
import '../../../../core/base/domain/use_case/use_case.dart';
import '../../../../core/exception/failure.dart';
import '../entity/number_trivia.dart';

class RandomNumberTriviaUseCase
    implements UseCase<NumberTriviaEntity, NoParams> {
  final NumberTriviaRepositoryI repository;

  RandomNumberTriviaUseCase(this.repository);

  @override
  Future<Either<Failure, NumberTriviaEntity>> call({NoParams? params}) async {
    return await repository.getRandomNumberTrivia();
  }
}
