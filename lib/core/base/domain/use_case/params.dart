import 'package:equatable/equatable.dart';

class Params extends Equatable {
  final dynamic params;

  Params({this.params});

  @override
  List<Object?> get props => [params];
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
