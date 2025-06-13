import 'package:json_annotation/json_annotation.dart';
import 'package:rickandmorty_app/features/list/data/datasources/remote/models/LocationDTO.dart';
import 'package:rickandmorty_app/features/list/data/datasources/remote/models/OriginDTO.dart';

part 'CharacterDTO.g.dart';

@JsonSerializable()
class CharacterDTO {

  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  OriginDTO origin;
  LocationDTO location;
  String image;
  List<String> episode;
  String url;
  String created;

  CharacterDTO({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory CharacterDTO.fromJson(json) => _$CharacterDTOFromJson(json);

  toJson() => _$CharacterDTOToJson(this);

  static List<CharacterDTO> fromJsonList(List? json) {
    return json?.map((e) => CharacterDTO.fromJson(e)).toList() ?? [];
  }

  @override
  bool operator == (Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    if (other is CharacterDTO) {
      return other.id == id;
    }

    return false;
  }

  factory CharacterDTO.empty() {
    return CharacterDTO(
      id: 0,
      name: '',
      status: '',
      species: '',
      type: '',
      gender: '',
      origin: OriginDTO.empty(),
      location: LocationDTO.empty(),
      image: '',
      episode: const [],
      url: '',
      created: '',
    );
  }
}
