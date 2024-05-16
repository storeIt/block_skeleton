import 'dart:convert';

import 'package:block_skeleton/core/exception/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/constant/app_constant.dart';
import '../../model/number_trivia_model.dart';
import 'number_trivia_local_data_i.dart';

class NumberLocalData implements NumberLocalDataI {
  final SharedPreferences sharedPreferences;

  NumberLocalData({required this.sharedPreferences});

  @override
  Future<void> cacheNumberTrivia(NumberModel triviaToCache) {
    return sharedPreferences.setString(
      AppConstant.keyCacheTrivia,
      json.encode(triviaToCache.toJson()),
    );
  }

  @override
  Future<NumberModel> getLastNumberTrivia() {
    final jsonString = sharedPreferences.getString(AppConstant.keyCacheTrivia);
    if (jsonString != null) {
      return Future.value(NumberModel.fromJson(json.decode(jsonString)));
    }
    throw CacheException();
  }
}
