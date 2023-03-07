import 'package:dependencies/dependencies.dart';

abstract class Failure extends Equatable {
  static const List<dynamic> properties = [];
  @override
  List<Object?> get props => [properties];
}

class ServerFailure extends Failure {}

class ClientFailure extends Failure {}

class CacheFailure extends Failure {}
