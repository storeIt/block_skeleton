import 'package:equatable/equatable.dart';

abstract class BaseEntity extends Equatable {
  final List<dynamic>? properties;

  BaseEntity(this.properties);

  @override
  List<Object?> get props => [properties];
}
