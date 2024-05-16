import '../../model/number_trivia_model.dart';

/// Throws [CacheException] if no cached data is present.
abstract interface class NumberLocalDataI {
  /// Throws [CacheException] if no cached data is present.
  Future<NumberModel> getLastNumberTrivia();

  Future<void> cacheNumberTrivia(NumberModel triviaToCache);
}
