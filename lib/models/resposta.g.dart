// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resposta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Resposta _$RespostaFromJson(Map<String, dynamic> json) {
  return Resposta(
    uuid: json['uuid'] as String,
    descricao: json['descricao'] as String,
    correta: json['correta'] as bool,
  );
}

Map<String, dynamic> _$RespostaToJson(Resposta instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'descricao': instance.descricao,
      'correta': instance.correta,
    };
