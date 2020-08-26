import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SimuladoDescricao {
  final int id;
  final String uuid;
  final String descricao;

  SimuladoDescricao({this.id, this.uuid, this.descricao});

  factory SimuladoDescricao.fromJson(Map<String, dynamic> json) {
    return SimuladoDescricao(
      id: json['id'] as int,
      uuid: json['uuid'],
      descricao: json['descricao']
    );
  }
}