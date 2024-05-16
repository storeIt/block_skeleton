import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart' as http;

import '../../../../../core/exception/exception.dart';
import '../../model/number_trivia_model.dart';
import 'number_trivia_remote_data_i.dart';

class NumberTriviaRemoteData implements NumberTriviaRemoteDataI {
  final http.Client client;

  NumberTriviaRemoteData({required this.client});

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) =>
      _fetchTrivia('http://numbersapi.com/$number');

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() =>
      _fetchTrivia('http://numbersapi.com/random');

  Future<NumberTriviaModel> _fetchTrivia(String url) async {
    final response = await client
        .get(url as Uri, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == HttpStatus.ok) {
      return NumberTriviaModel.fromJson(json.decode(response.body));
    }
    throw ServerException();
  }
}
