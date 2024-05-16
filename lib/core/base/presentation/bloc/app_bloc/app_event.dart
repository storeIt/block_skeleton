part of 'app_bloc.dart';

sealed class AppEvent extends BaseEvent {
  const AppEvent([List super.props = const []]);
}

class LoadingEvent extends AppEvent {}

class LoadedEvent extends AppEvent {
  LoadedEvent(this.data) : super([data]);

  final dynamic data;
}

class FailureEvent extends AppEvent {
  final String message;

  FailureEvent(this.message) : super([message]);
}