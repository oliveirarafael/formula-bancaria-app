import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class NovoUsuario {
  final String nome;
  final String email;
  final String senha;

  NovoUsuario({this.nome, this.email, this.senha});

  Map<String, dynamic> toJson(){
    return {
      "nome": this.nome,
      "email": this.email,
      "senha": this.senha
    };
  }
}