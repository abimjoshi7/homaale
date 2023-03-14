import 'package:dependencies/dependencies.dart';

abstract class NetworkInfo extends Equatable {
  Future<bool> isConnected();
}
