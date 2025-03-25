import 'package:dio/dio.dart';
import 'package:rickandmorty_app/features/list/data/datasources/remote/AbstractApiService.dart';
import 'package:rickandmorty_app/features/list/data/datasources/remote/models/ApiResponse.dart';

import '../../../../../core/network/error/ServerException.dart';
import 'models/CharacterDTO.dart';

class AllCharactersApiImpl extends AbstractApiService {
  final Dio dio;


  AllCharactersApiImpl(this.dio);

  @override
  Future<ApiResponse<List<CharacterDTO>>> getAllCharacters(int page) async {
    try {
      final response = await dio.get(
          "/character",
        queryParameters: {
          "page": page
        }
      );
      if (response.data == null) {
        throw ServerException("UnknownError", response.statusCode);
      }

      return ApiResponse.fromJson<List<CharacterDTO>>(response.data, CharacterDTO.fromJsonList);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}