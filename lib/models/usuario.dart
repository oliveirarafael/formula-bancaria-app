import 'package:json_annotation/json_annotation.dart';
part 'usuario.g.dart';

@JsonSerializable()
class Usuario {
  final String email;
  final String senha;

  Usuario(this.email, this.senha);

  factory Usuario.fromJson(Map<String, dynamic> json) => _$UsuarioFromJson(json);
  Map<String, dynamic> toJson() => _$UsuarioToJson(this);
}