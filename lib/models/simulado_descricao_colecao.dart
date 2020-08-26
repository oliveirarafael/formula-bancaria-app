import 'package:formula_bancaria_app/models/simulado_descricao.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SimuladoDescricaoColecao {
  final List<SimuladoDescricao> simulados;

  SimuladoDescricaoColecao({this.simulados});

  factory SimuladoDescricaoColecao.fromJson(Map<String, dynamic> json) {
    return SimuladoDescricaoColecao(
      simulados: List<SimuladoDescricao>.from(json["items"].map((x) => SimuladoDescricao.fromJson(x))),
    );
  }
}