import 'package:formula_bancaria_app/models/simulado.dart';
import 'package:json_annotation/json_annotation.dart';
part 'modulo.g.dart';

@JsonSerializable()
class Modulo {
  final String uuid;
  final String titulo;
  final String percentual;
  final String simuladoUUID;
  final Simulado simulado;

  Modulo({this.uuid, this.titulo, this.percentual, this.simuladoUUID, this.simulado});

  factory Modulo.fromJson(Map<String, dynamic> json) => _$ModuloFromJson(json);
  Map<String, dynamic> toJson() => _$ModuloToJson(this);

  @override
  String toString() {
    return '{uuid: $uuid, titulo: $titulo, percentual: $percentual}';
  }
}