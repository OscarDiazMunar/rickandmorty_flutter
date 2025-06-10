sealed class CharactersDetailEvent {}

class GetCharacterDetailEvent extends CharactersDetailEvent {
  final int id;

  GetCharacterDetailEvent(this.id);
}