import 'package:bloc/bloc.dart';
import 'package:util/helper/logger.dart';

class TntBlocObserver extends BlocObserver {
  final LoggerHelper _logger;

  TntBlocObserver() : _logger = LoggerHelper();

  @override
  void onEvent(Bloc bloc, Object? event) {
    // _logger.i('TnTBlocObserver onEvent $event');
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // _logger.e('TnTBlocObserver onError', error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // _logger.i('TnTBlocObserver onTransition $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    _logger.i('TnTBlocObserver onChange change: ${change.nextState}');
    super.onChange(bloc, change);
  }
}
