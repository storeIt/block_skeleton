import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/base/domain/use_case/params.dart';
import '../../../../core/base/presentation/bloc/event/base_event.dart';
import '../../../../core/base/presentation/bloc/state/base_app_state.dart';
import '../../../../core/base/presentation/bloc/state/base_state.dart';
import '../../../../core/constant/exception_constant.dart';
import '../../../../core/exception/failure.dart';
import '../../../../util/extension/failure_ext.dart';
import '../../../../util/helper/input_converter.dart';
import '../../domain/entity/number_ent.dart';
import '../../domain/use_case/concrete_number_use_case.dart';
import '../../domain/use_case/random_number_use_case.dart';

part 'number_trivia_event.dart';
part 'number_trivia_state.dart';

/// Reactive state management pattern which means that the data flows in one
/// direction: from the business logic to the UI.
/// The flow can be represented in three steps: Event -> BLoC -> State
/// Event: Any interaction from the user or external source and passed to the BLoC.
/// BLoC: Business logic component which handles the event and processes it (e.g. fetch data from use case).
/// State: Once the Use Case returns the data, the data will be put into state.
/// That state will be emitted to the UI and the UI will be updated accordingly.
class NumberTriviaBloc extends Bloc<NumberTriviaEvent, BaseState> {
  final ConcreteNumberTriviaUseCase concreteNumberTriviaUseCase;
  final RandomNumberTriviaUseCase randomNumberTriviaUseCase;
  final InputConverter inputConverter;

  NumberTriviaBloc({
    required this.concreteNumberTriviaUseCase,
    required this.randomNumberTriviaUseCase,
    required this.inputConverter,
  }) : super(EmptyState()) {
    on<GetConcreteTriviaEvent>((event, emit) async* {
      yield LoadingState;
      final Either<Failure, int> inputEither =
          inputConverter.stringToUnsignedInt(event.numberString);
      inputEither.fold((l) async* {
        yield ErrorState(ExceptionConstant.invalidInput);
      }, (integer) async* {
        yield LoadingState();
        final either = await concreteNumberTriviaUseCase.call(
            params: Params(params: integer));
        yield* _eitherLoadedOrErrorState(either);
      });
    });

    on<GetRandomTriviaEvent>((event, emit) async* {
      yield LoadingState;
      final either = await randomNumberTriviaUseCase.call();
      yield* _eitherLoadedOrErrorState(either);
    });
  }

  Stream<BaseState> _eitherLoadedOrErrorState(
      Either<Failure, NumberEntity> either) async* {
    yield either.fold(
      (failure) => ErrorState(failure.failureToMessage()),
      (trivia) => LoadedState(trivia),
    );
  }
}
