import 'package:equatable/equatable.dart';

// Why do we have Entity and not Model?
// The Domain layer is the most inner layer of the Clean Architecture.
// It consists of entities and use cases.
// Entities are the business objects of the application.
// They encapsulate the most general and high-level rules.
// They are independent of the database or any external source.
// They are the least likely to change when something external changes.
// In this case, the NumberEntity is the business object of the application.

// If we change our json api with xml api or any other data source, we will not change our entities.
// We will only change our models and mappers(converters).
abstract class BaseEntity extends Equatable {
  final List<dynamic>? properties;

  BaseEntity(this.properties);

  @override
  List<Object?> get props => [properties];
}
