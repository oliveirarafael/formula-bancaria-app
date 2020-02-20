// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modulo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Modulo _$ModuloFromJson(Map<String, dynamic> json) {
  return Modulo(
    uuid: json['uuid'] as String,
    titulo: json['titulo'] as String,
    descricao: json['descricao'] as String,
    percentual: json['percentual'] as String,
    simulado: json['simulado'] == null
        ? null
        : Simulado.fromJson(json['simulado'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ModuloToJson(Modulo instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'titulo': instance.titulo,
      'descricao': instance.descricao,
      'percentual': instance.percentual,
      'simulado': instance.simulado,
    };
