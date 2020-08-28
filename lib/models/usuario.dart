import 'package:json_annotation/json_annotation.dart';
part 'usuario.g.dart';

@JsonSerializable()
class Usuario {
  final int id;
  final String uuid;
  final String nome;
  final String email;
  final String senha;
  final bool assinante;
  final bool ehAluno;
  final bool ehProfessor;

  Usuario(
      {this.id,
      this.uuid,
      this.nome,
      this.email,
      this.senha,
      this.assinante,
      this.ehAluno,
      this.ehProfessor});

  factory Usuario.fromJson(Map<String, dynamic> json) =>
      _$UsuarioFromJson(json);
  Map<String, dynamic> toJson() => _$UsuarioToJson(this);

  bool getEhAluno() {
    if (ehAluno == null) return false;

    return ehAluno;
  }

  bool getEhProfessor() {
    if (ehProfessor == null) return false;

    return ehProfessor;
  }

  bool getAssinante() {
    if (assinante == null) return false;

    return assinante;
  }
}
