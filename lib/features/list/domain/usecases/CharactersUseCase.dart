import 'package:dartz/dartz.dart';
import 'package:rickandmorty_app/core/network/error/Failure.dart';
import 'package:rickandmorty_app/core/utils/usecase/BaseUseCase.dart';
import 'package:rickandmorty_app/features/list/data/datasources/remote/models/CharacterDTO.dart';
import 'package:rickandmorty_app/features/list/domain/repositories/AbstractCharacterRepository.dart';

class CharactersUseCase extends BaseUseCase<List<CharacterDTO>, int> {
  final AbstractCharacterRepository repository;

  CharactersUseCase(this.repository);

  @override
  Future<Either<Failure, List<CharacterDTO>>> execute(int params) async {
    final result = await repository.getAllCharacters(params);

    return result.fold((ifLeft){
      return Left(ifLeft);
    }, (ifRight) async{
      return Right(ifRight);
    });
  }
}