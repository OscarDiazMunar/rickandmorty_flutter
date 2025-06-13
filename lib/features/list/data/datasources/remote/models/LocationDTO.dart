import 'package:json_annotation/json_annotation.dart';

part 'LocationDTO.g.dart';

@JsonSerializable()
class LocationDTO {

  final String name;
  final String url;

  LocationDTO({
    required this.name,
    required this.url,
  });

  factory LocationDTO.fromJson(Map<String, dynamic> json) => _$LocationDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDTOToJson(this);

  factory LocationDTO.empty() {
    return LocationDTO(
      name: '',
      url: '',
    );
  }
}