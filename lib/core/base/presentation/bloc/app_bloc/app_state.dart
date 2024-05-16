part of 'app_bloc.dart';

sealed class AppState extends BaseState {
  final List<Object?> _props;

  AppState([this._props = const []]) : super([_props]);

  @override
  List<Object?> get props => [_props];
}

class EmptyState extends AppState {}

class LoadingState extends AppState {}

class LoadedState extends AppState {
  final dynamic data;

  LoadedState(this.data) : super([data]);
}

class FailureState extends AppState {
  final String message;

  FailureState(this.message) : super([message]);
}