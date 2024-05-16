part of 'app_bloc.dart';

sealed class AppState extends BaseState {
  AppState([this._props = const []]) : super([_props]);

  final List<Object?> _props;

  // bool isLoading = false;

  @override
  List<Object?> get props => [_props];
}

class Empty extends AppState {}

class Idle extends AppState {}

class Loading extends AppState {
  Loading() {
    isLoading = true;
  }
}

class Loaded extends AppState {
  Loaded(this.data) : super([data]) {
    print('log_tag data: $data');
    isLoading = false;
  }

  final dynamic data;
}

class FailureState extends AppState {
  FailureState(this.message) : super([message]) {
    isLoading = false;
  }

  final String message;
}
