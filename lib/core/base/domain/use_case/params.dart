import 'package:equatable/equatable.dart';

class Params extends Equatable {
  Params({this.params});

  final dynamic params;

  @override
  List<Object?> get props => [params];
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
