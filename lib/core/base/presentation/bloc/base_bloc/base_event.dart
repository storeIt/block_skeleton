part of 'base_bloc.dart';

abstract class BaseEvent extends Equatable {
  final List<Object?> _props;

  const BaseEvent([this._props = const []]);

  @override
  List<Object> get props => [_props];
}