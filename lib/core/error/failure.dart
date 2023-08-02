import 'package:dependencies/dependencies.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {}

class ClientFailure extends Failure {}

class CacheFailure extends Failure {}
