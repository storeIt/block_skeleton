import 'package:bloc/bloc.dart';
import 'package:exception/exception.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/base/domain/use_case/params.dart';
import '../../../../core/base/presentation/bloc/app_bloc/app_bloc.dart';
import '../../../../core/base/presentation/bloc/base_bloc/base_bloc.dart';
import '../../../../util/helper/input_converter.dart';
import '../../domain/entity/number_ent.dart';
import '../../domain/use_case/concrete_number_use_case.dart';
import '../../domain/use_case/random_number_use_case.dart';

part 'number_state.dart';

class NumberCubit extends Cubit<BaseState> {
  final ConcreteNumberUseCase concreteNumberUseCase;
  final RandomNumberUseCase randomNumberUseCase;

  NumberCubit({
    required this.concreteNumberUseCase,
    required this.randomNumberUseCase,
  }) : super(Empty());

  // Future<void> getConcreteNumber(String numberString) async {
  //   emit(Loading());
  //   final Either<Failure, int> inputEither =
  //       InputConverter().stringToUnsignedInt(numberString);
  //
  //   await inputEither.fold(
  //     (l) async {
  //       emit(FailureState('Invalid input'));
  //     },
  //     (integer) async {
  //       final either =
  //           await concreteNumberUseCase(params: Params(params: integer));
  //       emit(await _eitherLoadedOrErrorState(either));
  //     },
  //   );
  // }

  Future<void> getConcreteNumber(String numberString) async {
    // emit(Loading());
    final Either<Failure, int> inputEither =
        InputConverter().stringToUnsignedInt(numberString);

    await inputEither.fold(
      (l) async {
        emit(FailureState('Invalid input'));
      },
      (integer) async {
        final either =
            await concreteNumberUseCase(params: Params(params: integer));
        emit(await _eitherLoadedOrErrorState(either));
      },
    );
  }

  Future<void> getRandomNumber() async {
    emit(Loading());
    final either = await randomNumberUseCase.call();
    emit(await _eitherLoadedOrErrorState(either));
  }

  Future<BaseState> _eitherLoadedOrErrorState(
    Either<Failure, NumberEntity> either,
  ) async {
    return await either.fold(
      (failure) => FailureState(_mapFailureToMessage(failure)),
      (numEnt) => Loaded(numEnt),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return NetworkConstant.requestError;
      case CacheFailure:
        return 'Cache failure';
      default:
        return 'Unexpected error';
    }
  }
}
