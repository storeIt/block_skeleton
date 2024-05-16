part of 'number_bloc.dart';

sealed class NumberState extends BaseState {
  NumberState([List props = const []]) : super(props);
}

// Could be dropped and use App EmptyState instead
// class EmptyNumberState extends NumberState {}
