import 'package:dartz/dartz.dart';
import 'package:rickandmorty_app/core/network/error/Failure.dart';
import 'package:rickandmorty_app/features/list/data/datasources/remote/models/CharacterDTO.dart';

abstract class AbstractCharacterRepository {
  Future<Either<Failure, List<CharacterDTO>>> getAllCharacters();
}