// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsuarioLogin _$UsuarioFromJson(Map<String, dynamic> json) {
  return UsuarioLogin(
    json['email'] as String,
    json['senha'] as String,
  );
}

Map<String, dynamic> _$UsuarioToJson(UsuarioLogin instance) => <String, dynamic>{
      'email': instance.email,
      'senha': instance.senha,
    };
