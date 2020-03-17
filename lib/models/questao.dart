import 'package:formula_bancaria_app/models/modulo.dart';
import 'package:formula_bancaria_app/models/resposta.dart';
import 'package:json_annotation/json_annotation.dart';
part 'questao.g.dart';

@JsonSerializable()
class Questao {
  final String uuid;
  final String descricao;
  final String comentario;
  final Modulo modulo;
  final List<Resposta> respostas;

  Questao({this.uuid, this.descricao, this.comentario, this.modulo, this.respostas});

  factory Questao.fromJson(Map<String, dynamic> json) => _$QuestaoFromJson(json);
  Map<String, dynamic> toJson() => _$QuestaoToJson(this);
}