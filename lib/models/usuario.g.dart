// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usuario _$UsuarioFromJson(Map<String, dynamic> json) {
  return Usuario(
    id: json['id'] as int,
    nome: json['nome'] as String,
    email: json['email'] as String,
    senha: json['senha'] as String,
    assinante: json['assinante'] as bool,
    ehAluno: json['ehAluno'] as bool,
    ehProfessor: json['ehProfessor'] as bool,
  );
}

Map<String, dynamic> _$UsuarioToJson(Usuario instance) => <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'email': instance.email,
      'senha': instance.senha,
      'assinante': instance.assinante,
      'ehAluno': instance.ehAluno,
      'ehProfessor': instance.ehProfessor
    };
