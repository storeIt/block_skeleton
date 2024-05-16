import 'package:exception/exception.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/base/domain/use_case/params.dart';
import '../../../../core/base/presentation/bloc/app_bloc/app_bloc.dart';
import '../../../../core/base/presentation/bloc/base_bloc/base_bloc.dart';
import '../../../../util/helper/input_converter.dart';
import '../../domain/entity/number_ent.dart';
import '../../domain/use_case/concrete_number_use_case.dart';
import '../../domain/use_case/random_number_use_case.dart';

part 'number_event.dart';
part 'number_state.dart';

class NumberBloc extends BaseBloc {
  final ConcreteNumberUseCase concreteNumberUseCase;
  final RandomNumberUseCase randomNumberUseCase;

  NumberBloc(
    super.initialState, {
    required this.concreteNumberUseCase,
    required this.randomNumberUseCase,
  }) {
    on<GetConcreteNumberEvent>((
      event,
      emit,
    ) async {
      emit(Loading());
      final Either<Failure, int> inputEither =
          InputConverter().stringToUnsignedInt(event.numberString);

      await inputEither.fold(
        (l) async {
          emit(FailureState(NetworkConstant.requestError));
        },
        (integer) async {
          final either =
              await concreteNumberUseCase(params: Params(params: integer));
          emit(await _eitherLoadedOrErrorState(either));
        },
      );
    });

    on<GetRandomNumberEvent>((
      event,
      emit,
    ) async {
      emit(Loading());
      final either = await randomNumberUseCase.call();
      _eitherLoadedOrErrorState(either);
    });
  }

  Future<AppState> _eitherLoadedOrErrorState(
    Either<Failure, NumberEntity> either,
  ) async {
    return await either.fold(
      (failure) => FailureState(_mapFailureToMessage(failure)),
      (numEnt) => Loaded(numEnt),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    add(LoadingEvent());
    switch (failure.runtimeType) {
      case ServerFailure:
        return NetworkConstant.serverError;
      case CacheFailure:
        return 'Cache Failure';
      default:
        return 'Unexpected error';
    }
  }
}
