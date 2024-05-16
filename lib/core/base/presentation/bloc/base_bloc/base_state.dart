part of 'base_bloc.dart';

class BaseState extends Equatable {
  BaseState([this._props = const []]);

  bool isLoading = false;
  final List<Object?> _props;

  @override
  List<Object?> get props => [_props];
}
