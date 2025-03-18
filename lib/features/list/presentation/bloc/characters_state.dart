part of 'characters_bloc.dart';

sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

final class CharactersLoading extends CharactersState {}

final class CharactersSuccess extends CharactersState {
  final List<CharacterDTO> characters;

  CharactersSuccess(this.characters);
}

final class CharactersError extends CharactersState {
  final String message;

  CharactersError(this.message);
}