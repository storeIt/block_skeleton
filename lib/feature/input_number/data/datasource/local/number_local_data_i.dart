import '../../model/number_model.dart';

/// Throws [CacheException] if no cached data is present.
abstract interface class NumberLocalDataI {
  /// Throws [CacheException] if no cached data is present.
  Future<NumberModel> getLastNumber();

  Future<void> cacheNumber(NumberModel numModelToCache);
}
