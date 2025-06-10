import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_app/core/utils/injections.dart';
import 'package:rickandmorty_app/features/list/data/datasources/remote/models/CharacterDTO.dart';
import 'package:rickandmorty_app/features/list/domain/usecases/CharacterDetailUseCase.dart';
import 'package:rickandmorty_app/features/list/presentation/bloc/detail/character_detail_bloc.dart';
import 'package:rickandmorty_app/features/list/presentation/bloc/detail/character_detail_event.dart';
import 'package:rickandmorty_app/features/list/presentation/bloc/detail/character_detail_state.dart';

class DetailCharacterScreen extends StatefulWidget {
  final int idCharacter;
  const DetailCharacterScreen({super.key, required this.idCharacter});

  @override
  State<DetailCharacterScreen> createState() => _CharactersDetailPageState();
}

class _CharactersDetailPageState extends State<DetailCharacterScreen> {

  CharacterDTO character = CharacterDTO.empty();
  CharacterDetailBloc _bloc = CharacterDetailBloc(characterDetailUseCase: serviceLocator<CharacterDetailUseCase>());

  @override
  void initState(){
    callCharacterDetail(widget.idCharacter);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Rick and Morty Characters'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: BlocConsumer<CharacterDetailBloc, CharactersDetailState>(
            bloc: _bloc,
            listener: (context, state){
              if(state is CharactersDetailSuccess){
                character = state.character;
              }
            },
            builder: (context, state) {
              if(state is CharactersDetailLoading || state is CharactersDetailInitial){
                return Center(child: const CircularProgressIndicator());
              } else {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(character.image, height: 250, fit: BoxFit.cover),
                      ),
                      const SizedBox(height: 16),

                      // Name & Status
                      Text(
                        character.name,
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            character.status == 'Alive' ? Icons.check_circle : Icons.cancel,
                            color: character.status == 'Alive' ? Colors.green : Colors.red,
                          ),
                          const SizedBox(width: 8),
                          Text(character.status),
                        ],
                      ),
                      const Divider(height: 32),

                      // Species & Gender
                      Text('Species: ${character.species}'),
                      const SizedBox(height: 4),
                      Text('Gender: ${character.gender}'),
                      const Divider(height: 32),

                      // Origin & Location
                      Text('Origin: ${character.origin.name}'),
                      const SizedBox(height: 4),
                      Text('Location: ${character.location.name}'),
                      const Divider(height: 32),

                      // Episodes count
                      Text('Appears in ${character.episode.length} episode(s)'),
                    ],
                  ),
                );
              }}),
          ),
      )
    );
  }

  void callCharacterDetail(int idCharacter) {
    _bloc.add(GetCharacterDetailEvent(idCharacter));
  }
}