import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_app/core/utils/injections.dart';
import 'package:rickandmorty_app/features/list/data/datasources/remote/models/CharacterDTO.dart';

import '../../domain/usecases/CharactersUseCase.dart';
import '../bloc/characters_bloc.dart';

class CharactersListScreen extends StatelessWidget {
  const CharactersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CharactersListPage(),
    );
  }
}

class CharactersListPage extends StatefulWidget {
  const CharactersListPage({super.key});

  @override
  State<CharactersListPage> createState() => _CharactersListPageState();
}

class _CharactersListPageState extends State<CharactersListPage> {

  CharactersBloc _bloc = CharactersBloc(charactersUseCase: serviceLocator<CharactersUseCase>());
  List<CharacterDTO> charactersList = [];

  @override
  void initState() {
    callCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Character Grid')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
            child: BlocConsumer<CharactersBloc, CharactersState>(
              bloc: _bloc,
              listener: (context, state) {
                if (state is CharactersSuccess) {
                  charactersList = state.characters;
                }
              },
              builder: (context, state) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: charactersList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Expanded(
                              child: Image.network(
                                charactersList[index].image,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            charactersList[index].name,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            )
        )
      ),
    );
  }

  callCharacters() {
    _bloc.add(GetCharactersEvent(),);
  }
}

