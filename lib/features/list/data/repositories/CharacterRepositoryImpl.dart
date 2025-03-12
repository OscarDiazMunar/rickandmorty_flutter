import 'package:dartz/dartz.dart';
import 'package:rickandmorty_app/core/network/error/Failure.dart';
import 'package:rickandmorty_app/features/list/data/datasources/remote/AllCharactersApiImpl.dart';
import 'package:rickandmorty_app/features/list/data/datasources/remote/models/CharacterDTO.dart';
import 'package:rickandmorty_app/features/list/domain/repositories/AbstractCharacterRepository.dart';

import '../../../../core/network/error/ServerException.dart';

class CharacterRepositoryImpl extends AbstractCharacterRepository {
  final AllCharactersApiImpl allCharacteresApiImpl;

  CharacterRepositoryImpl(this.allCharacteresApiImpl);

  @override
  Future<Either<Failure, List<CharacterDTO>>> getAllCharacters() async {
    try {
      final response = await allCharacteresApiImpl.getAllCharacters();
      return Right(response.results ?? []);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } catch (e) {
      return Left(ServerFailure(e.toString(), null));
    }
  }
}