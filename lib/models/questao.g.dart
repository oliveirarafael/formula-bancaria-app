// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Questao _$QuestaoFromJson(Map<String, dynamic> json) {
  return Questao(
    uuid: json['uuid'] as String,
    descricao: json['descricao'] as String,
    comentario: json['comentario'] as String,
    modulo: json['modulo'] == null
        ? null
        : Modulo.fromJson(json['modulo'] as Map<String, dynamic>),
    respostas: (json['respostas'] as List)
        ?.map((e) =>
            e == null ? null : Resposta.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$QuestaoToJson(Questao instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'descricao': instance.descricao,
      'comentario': instance.comentario,
      'modulo': instance.modulo,
      'respostas': instance.respostas,
    };
