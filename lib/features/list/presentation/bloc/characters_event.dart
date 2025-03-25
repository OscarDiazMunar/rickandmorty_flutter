part of 'characters_bloc.dart';

sealed class CharactersEvent {}

class GetCharactersEvent extends CharactersEvent {
  final int page;

  GetCharactersEvent(this.page);
}