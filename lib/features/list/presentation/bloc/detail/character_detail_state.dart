import '../../../data/datasources/remote/models/CharacterDTO.dart';

sealed class CharactersDetailState {}

final class CharactersDetailInitial extends CharactersDetailState {}

final class CharactersDetailLoading extends CharactersDetailState {}

final class CharactersDetailSuccess extends CharactersDetailState {
  final CharacterDTO character;

  CharactersDetailSuccess(this.character);
}

final class CharacterDetailError extends CharactersDetailState {
  final String message;

  CharacterDetailError(this.message);
}