// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simulado.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Simulado _$SimuladoFromJson(Map<String, dynamic> json) {
  return Simulado(
    uuid: json['uuid'] as String,
    titulo: json['titulo'] as String,
    descricao: json['descricao'] as String,
    modulos: (json['modulos'] as List)
        ?.map((e) =>
            e == null ? null : Modulo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SimuladoToJson(Simulado instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'titulo': instance.titulo,
      'descricao': instance.descricao,
      'modulos': instance.modulos,
    };
