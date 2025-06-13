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
  Future<Either<Failure, List<CharacterDTO>>> getAllCharacters(int page) async {
    try {
      final response = await allCharacteresApiImpl.getAllCharacters(page);
      return Right(response.results ?? []);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } catch (e) {
      return Left(ServerFailure(e.toString(), null));
    }
  }

  @override
  Future<Either<Failure, CharacterDTO>> getCharacterById(int id) async {
    try {
      final response = await allCharacteresApiImpl.getCharacterById(id);

      final dto = response.results;

      if (dto == null) {
        return Left(ServerFailure('No character found for id $id', null));
      }

      return Right(dto);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } catch (e) {
      return Left(ServerFailure(e.toString(), null));
    }
  }
}