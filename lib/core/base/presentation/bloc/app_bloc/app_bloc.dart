import 'package:flutter_bloc/flutter_bloc.dart';

import '../base_bloc/base_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends BaseBloc {
  AppBloc() : super(Empty()) {
    on<LoadingEvent>(_onLoading);
    on<LoadedEvent>(_onLoaded);
    on<FailureEvent>(_onFailure);
  }

  bool get isLoading => state is Loading;

  bool get isLoaded => state is Loaded;

  bool get isFailure => state is FailureState;

  BaseState getState() => state;

  void _onLoading(LoadingEvent event, Emitter<BaseState> emit) {
    emit(Loading());
  }

  void _onLoaded(LoadedEvent event, Emitter<BaseState> emit) {
    emit(Loaded(event.data));
  }

  void _onFailure(FailureEvent event, Emitter<BaseState> emit) {
    emit(FailureState(event.message));
  }
}
