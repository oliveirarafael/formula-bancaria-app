
import 'package:json_annotation/json_annotation.dart';
part 'simulado.g.dart';

@JsonSerializable()
class Simulado {
  final String titulo;
  final String descricao;

  Simulado(this.titulo, this.descricao);

  factory Simulado.fromJson(Map<String, dynamic> json) => _$SimuladoFromJson(json);
  Map<String, dynamic> toJson() => _$SimuladoToJson(this);

  @override
  String toString() {
    return '{titulo: $titulo, descricao: $descricao}';
  }

}