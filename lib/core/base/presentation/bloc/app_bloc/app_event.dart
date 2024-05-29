part of 'app_bloc.dart';

sealed class AppEvent extends BaseEvent {
  const AppEvent([List super.props = const []]);
}

class LoadingEvent extends AppEvent {}

class LoadedEvent extends AppEvent {
  LoadedEvent(this.data) : super([data]);

  final dynamic data;
}

class IdleEvent extends AppEvent {}

class FailureEvent extends AppEvent {
  FailureEvent(this.message) : super([message]);

  final String message;
}

class DialogEvent extends AppEvent {
  DialogEvent({required this.type, required this.args}) : super([type, args]);

  final DialogType type;
  final DialogArgsI args;
}
