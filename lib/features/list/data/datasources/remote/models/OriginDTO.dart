import 'package:json_annotation/json_annotation.dart';

part 'OriginDTO.g.dart';

@JsonSerializable()
class OriginDTO {

  final String name;
  final String url;

  OriginDTO({
    required this.name,
    required this.url,
  });

  factory OriginDTO.fromJson(Map<String, dynamic> json) => _$OriginDTOFromJson(json);

  Map<String, dynamic> toJson() => _$OriginDTOToJson(this);

}