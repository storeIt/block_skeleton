part of 'number_trivia_bloc.dart';

sealed class NumberTriviaEvent extends BaseEvent {
  NumberTriviaEvent([List props = const []]) : super(props);
}

class GetConcreteTriviaEvent extends NumberTriviaEvent {
  final String numberString;

  GetConcreteTriviaEvent(this.numberString) : super([numberString]);
}

class GetRandomTriviaEvent extends NumberTriviaEvent {}
