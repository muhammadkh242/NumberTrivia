import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectionInfo {
  InternetConnectionChecker connectionChecker;

  ConnectionInfo(this.connectionChecker);

  Future<bool> get isConnected => connectionChecker.hasConnection;
}
