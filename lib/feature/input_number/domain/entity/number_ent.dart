import 'package:block_skeleton/core/base/domain/base_entity.dart';

class NumberTriviaEntity extends BaseEntity {
  final String text;
  final int number;

  NumberTriviaEntity({
    required this.text,
    required this.number,
  }) : super([text, number]);

  @override
  List<Object?> get props => [text, number];
}
