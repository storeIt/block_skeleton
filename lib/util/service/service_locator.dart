import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:util/helper/logger.dart';

import '../../feature/input_number/data/datasource/local/number_local_data.dart';
import '../../feature/input_number/data/datasource/remote/number_remote_data.dart';
import '../../feature/input_number/data/repository/number_repository.dart';
import '../../feature/input_number/domain/use_case/concrete_number_use_case.dart';
import '../../feature/input_number/domain/use_case/random_number_use_case.dart';

GetIt sl = GetIt.instance;

Future<void> setupLocator() async {
  /**
   * ! Feature
   */
  sl.registerFactory<http.Client>(() => http.Client());
  sl.registerFactory<NumberRemoteData>(
      () => NumberRemoteData(client: sl<http.Client>()));
  sl.registerFactory<NumberLocalData>(
      () => NumberLocalData(sharedPreferences: sl<SharedPreferences>()));
  sl.registerFactory<NumberRepository>(() => NumberRepository(
      remoteDataSource: sl<NumberRemoteData>(),
      localDataSource: sl<NumberLocalData>()));
  sl.registerFactory<ConcreteNumberUseCase>(
      () => ConcreteNumberUseCase(sl<NumberRepository>()));
  sl.registerFactory<RandomNumberUseCase>(
      () => RandomNumberUseCase(sl<NumberRepository>()));
  /**
   * ! Core
   */

  /**
   * ! Util
   */

  /**
   * ! 3rd Party
   */

  sl.registerFactory<LoggerHelper>(() => LoggerHelper());

  SharedPreferences _prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(
      () => _prefs); // SharedPreferences
}
