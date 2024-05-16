import '../base_bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

abstract class AppBloc extends BaseBloc {
  AppBloc(): super(EmptyState()) {
    on<LoadingEvent>(_onLoading);
    on<LoadedEvent>(_onLoaded);
    on<FailureEvent>(_onFailure);
  }

  bool get isLoading => state is LoadingState;

  void _onLoading(LoadingEvent event, Emitter<BaseState> emit) {
    emit(LoadingState());
  }

  void _onLoaded(LoadedEvent event, Emitter<BaseState> emit) {
    emit(LoadedState(event.data));
  }

  void _onFailure(FailureEvent event, Emitter<BaseState> emit) {
    emit(FailureState(event.message));
  }
}
