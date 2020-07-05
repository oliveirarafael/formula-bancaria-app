import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Usuario {
  final int id;
  final String uuid;
  final String nome;
  final String email;
  bool assinante = false;
  bool ehAluno = false;
  bool ehProfessor = false;

  Usuario({this.id, this.uuid, this.nome, this.email, this.assinante, this.ehAluno, this.ehProfessor});

  bool getEhAluno() {
    if(ehAluno == null) return false;

    return ehAluno;
  }

  bool getEhProfessor() {
    if(ehProfessor == null) return false;

    return ehProfessor;
  }

  bool getAssinante() {
    if(assinante == null) return false;

    return assinante;
  }

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      uuid: json['uuid'],
      nome: json['nome'],
      email: json['email'],
      assinante: json['assinante'],
      ehAluno: json['ehAluno'],
      ehProfessor: json['ehProfessor']
    );
  }
}