import 'package:json_annotation/json_annotation.dart';
part 'resposta.g.dart';

@JsonSerializable()
class Resposta {
  final String uuid;
  final String descricao;
  final bool correta;

  Resposta({this.uuid, this.descricao, this.correta}); 

  factory Resposta.fromJson(Map<String, dynamic> json) => _$RespostaFromJson(json);
  Map<String, dynamic> toJson() => _$RespostaToJson(this);
}