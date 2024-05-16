import 'network_info_i.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfo implements NetworkInfoI {
  @override
  Future<bool> get isConnected async =>
      await InternetConnectionChecker().hasConnection;
}
