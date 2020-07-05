import 'package:json_annotation/json_annotation.dart';
part 'usuario.g.dart';

@JsonSerializable()
class UsuarioLogin {
  final String email;
  final String senha;

  UsuarioLogin(this.email, this.senha);

  factory UsuarioLogin.fromJson(Map<String, dynamic> json) => _$UsuarioFromJson(json);
  Map<String, dynamic> toJson() => _$UsuarioToJson(this);
}