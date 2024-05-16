import '../../domain/entity/number_ent.dart';

class NumberModel extends NumberEntity {
  NumberModel({
    required String text,
    required int number,
  }) : super(text: text, number: number);

  factory NumberModel.fromJson(Map<String, dynamic> json) =>
      NumberModel(
        text: json['text'],
        number: (json['number'] as num).toInt(),
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'number': number,
      };
}
