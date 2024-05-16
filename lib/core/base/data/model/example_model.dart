import 'base_model.dart';

/**
 * This class is a model example.
 * It extends the BaseModel class, because all models should have properties.
 * */
class ExampleModel extends BaseModel {
  ExampleModel({required this.id, required this.name}) : super([id, name]);

  final int id;
  final String name;

  factory ExampleModel.fromJson(Map<String, dynamic> json) {
    return ExampleModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
