
import 'package:dartz/dartz.dart';
import 'package:rickandmorty_app/core/network/error/Failure.dart';

abstract class BaseUseCase<T, Params> {
  Future<Either<Failure,T>> execute(Params params);
}

class NoParams {}