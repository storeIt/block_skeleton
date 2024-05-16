part of 'base_bloc.dart';

class BaseState extends Equatable {
  final List<Object?> _props;

  const BaseState([this._props = const []]);

  @override
  List<Object?> get props => [_props];
}
