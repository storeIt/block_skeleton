import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../core/base/util/network_info_i.dart';

class NetworkInfo implements NetworkInfoI {
  @override
  Future<bool> get isConnected async =>
      await InternetConnectionChecker().hasConnection;
}
