import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_app/features/list/domain/usecases/CharactersUseCase.dart';

import '../../../../core/utils/usecase/BaseUseCase.dart';
import '../../data/datasources/remote/models/CharacterDTO.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharactersUseCase charactersUseCase;

  CharactersBloc({required this.charactersUseCase}) : super(CharactersInitial()) {
    on<GetCharactersEvent>(_GetCharactersEventToState);
  }

  _GetCharactersEventToState(GetCharactersEvent event, Emitter<CharactersState> emit) async {

    if (state is CharactersLoading) return;

    final result = await charactersUseCase.execute(NoParams());

    result.fold((ifLeft) {
      emit(CharactersError(ifLeft.errorMessage));
    }, (ifRight) async {
      emit(CharactersSuccess(ifRight));
    });
  }
}