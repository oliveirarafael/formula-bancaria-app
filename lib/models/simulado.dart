import 'package:formula_bancaria_app/models/modulo.dart';
import 'package:json_annotation/json_annotation.dart';
part 'simulado.g.dart';

@JsonSerializable()
class Simulado {
  final String uuid;
  final String titulo;
  final String descricao;
  final List<Modulo> modulos;

  Simulado({this.uuid, this.titulo, this.descricao, this.modulos});

  factory Simulado.fromJson(Map<String, dynamic> json) => _$SimuladoFromJson(json);
  Map<String, dynamic> toJson() => _$SimuladoToJson(this);

  @override
  String toString() {
    return '{uuid: $uuid, titulo: $titulo, descricao: $descricao, modulos: $modulos}';
  }

}