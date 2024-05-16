import 'dart:convert';
import 'dart:io';

import 'package:exception/exception.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/constant/api_constant.dart';
import '../../model/number_model.dart';
import 'number_remote_data_i.dart';

class NumberRemoteData implements NumberRemoteDataI {
  final http.Client client;

  NumberRemoteData({required this.client});

  @override
  Future<NumberModel> getConcreteNumber(int number) =>
      _fetchNumber('${ApiConstant.baseUrl}$number');

  @override
  Future<NumberModel> getRandomNumber() =>
      _fetchNumber('${ApiConstant.endPointRandom}');

  Future<NumberModel> _fetchNumber(String url) async {
    print('log_tag String url: $url');
    Uri? uri = Uri.tryParse(url);
    if (uri == null) {
      throw ServerFailure(
        NetworkConstant.requestError,
        ServerFailure,
        StackTrace.current,
      );
    }
    final response =
        await client.get(uri, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == HttpStatus.ok) {
      return NumberModel.fromJson(json.decode(response.body));
    }
    throw ServerFailure(
      NetworkConstant.requestError,
      ServerFailure,
      StackTrace.current,
    );
  }
}
