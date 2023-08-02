import 'package:cipher/core/core.dart';

abstract class Usecase<T, P> {
  Future<(Failure?, T)> call(P p);
}

class NoParams {}
