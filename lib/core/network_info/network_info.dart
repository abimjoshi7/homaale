import 'package:equatable/equatable.dart';

abstract class NetworkInfo extends Equatable {
  Future<bool> isConnected();
}
