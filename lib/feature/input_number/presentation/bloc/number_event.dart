part of 'number_bloc.dart';

sealed class NumberEvent extends BaseEvent {
  NumberEvent([List props = const []]) : super(props);
}

class GetConcreteNumberEvent extends NumberEvent {
  final String numberString;

  GetConcreteNumberEvent(this.numberString);
}

class GetRandomNumberEvent extends NumberEvent {}
