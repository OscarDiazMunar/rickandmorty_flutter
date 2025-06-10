import 'package:rickandmorty_app/core/utils/injections.dart';
import 'package:rickandmorty_app/features/list/data/datasources/remote/DioNetwork.dart';
import 'package:rickandmorty_app/features/list/domain/usecases/CharactersUseCase.dart';

import '../../data/datasources/remote/AllCharactersApiImpl.dart';
import '../../data/repositories/CharacterRepositoryImpl.dart';
import '../../domain/repositories/AbstractCharacterRepository.dart';
import '../../domain/usecases/CharacterDetailUseCase.dart';

initCharactersInjections(){
  serviceLocator.registerSingleton<AllCharactersApiImpl>(AllCharactersApiImpl(DioNetwork.appApi));
  serviceLocator.registerSingleton<AbstractCharacterRepository>(CharacterRepositoryImpl(serviceLocator()));
  serviceLocator.registerSingleton<CharactersUseCase>(CharactersUseCase(serviceLocator()));
  serviceLocator.registerSingleton<CharacterDetailUseCase>(CharacterDetailUseCase(serviceLocator()));
}