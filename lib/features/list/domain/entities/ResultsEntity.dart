import 'package:rickandmorty_app/features/list/domain/entities/LocationEntity.dart';
import 'package:rickandmorty_app/features/list/domain/entities/OriginEntity.dart';

class ResultsEntity {

  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  OriginEntity origin;
  LocationEntity location;
  String image;
  List<String> episode;
  String url;
  String created;

  ResultsEntity({
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
}