import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_app/features/list/domain/usecases/CharacterDetailUseCase.dart';
import 'package:rickandmorty_app/features/list/presentation/bloc/detail/character_detail_event.dart';
import 'package:rickandmorty_app/features/list/presentation/bloc/detail/character_detail_state.dart';

class CharacterDetailBloc extends Bloc<CharactersDetailEvent, CharactersDetailState>{
  final CharacterDetailUseCase characterDetailUseCase;

  CharacterDetailBloc({required this.characterDetailUseCase}): super(CharactersDetailInitial()) {
    on<GetCharacterDetailEvent>(_GetCharacterDetailEventToState);
  }

  _GetCharacterDetailEventToState(GetCharacterDetailEvent event, Emitter<CharactersDetailState> emit) async {
    if(state is CharactersDetailLoading) return;
    final result = await characterDetailUseCase.execute(event.id);

    return result.fold((ifLeft){
      emit(CharacterDetailError(ifLeft.errorMessage));
    },(ifRight){
      emit(CharactersDetailSuccess(ifRight));
    });
  }
}