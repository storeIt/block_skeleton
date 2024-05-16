import 'dart:convert';

import 'package:exception/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/constant/app_constant.dart';
import '../../model/number_model.dart';
import 'number_local_data_i.dart';

class NumberLocalData implements NumberLocalDataI {
  final SharedPreferences sharedPreferences;

  NumberLocalData({required this.sharedPreferences});

  @override
  Future<void> cacheNumber(NumberModel numberToCache) {
    return sharedPreferences.setString(
      AppConstant.keyCacheNumber,
      json.encode(numberToCache.toJson()),
    );
  }

  @override
  Future<NumberModel> getLastNumber() {
    final jsonString = sharedPreferences.getString(AppConstant.keyCacheNumber);
    if (jsonString != null) {
      return Future.value(NumberModel.fromJson(json.decode(jsonString)));
    }
    // throw CacheException();
    throw UnhandledFailure('CacheException', StackTrace.current);
  }
}
