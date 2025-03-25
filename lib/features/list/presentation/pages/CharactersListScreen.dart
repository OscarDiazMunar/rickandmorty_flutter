import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
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

  late final PagingController<int, CharacterDTO> _pagingController;

  String _searchQuery = "";
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {

    _pagingController = PagingController<int, CharacterDTO>(
      firstPageKey: 1,
    );

    _pagingController.addPageRequestListener((pageKey) {
      callCharacters(pageKey, _searchQuery);
    });

    super.initState();
  }


  @override
  void dispose() {
    _pagingController.dispose();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Rick and Morty Characters'),
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(56),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: TextField(
                      controller: _searchController,
                      onChanged: _onSearchChanged,
                      decoration: const InputDecoration(
                        hintText: "Search...",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
              ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
            child: BlocConsumer<CharactersBloc, CharactersState>(
              bloc: _bloc,
              listener: (context, state) {
                if (state is CharactersSuccess) {
                  charactersList = state.characters;
                  final nextPageKey = (_pagingController.nextPageKey ?? 1) + 1;
                  _pagingController.appendPage(state.characters, nextPageKey);
                }
              },
              builder: (context, state) {
                return PagedGridView(
                    pagingController: _pagingController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.8,
                    ),
                    builderDelegate:
                    PagedChildBuilderDelegate<CharacterDTO>(
                        itemBuilder: (context, item, index) {
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
                                      item.image,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  item.name,
                                  style: TextStyle(fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          );
                        }
                    )
                );
              })
        )
      ),
    );
  }

  callCharacters(int page, String searchQuery) {
    _bloc.add(GetCharactersEvent(page, searchQuery),);
  }

  void _onSearchChanged(String query) {
    _searchQuery = query;
    _pagingController.refresh();
  }
}

