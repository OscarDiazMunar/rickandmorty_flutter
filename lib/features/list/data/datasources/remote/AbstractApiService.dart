import 'package:rickandmorty_app/features/list/data/datasources/remote/models/ApiResponse.dart';
import 'package:rickandmorty_app/features/list/data/datasources/remote/models/CharacterDTO.dart';

abstract class AbstractApiService {
  Future<ApiResponse<List<CharacterDTO>>> getAllCharacters(int page);
  Future<ApiResponse<CharacterDTO>> getCharacterById(int id);
}