import 'dart:convert';
import 'dart:io';

import 'package:formula_bancaria_app/models/auth.dart';
import 'package:formula_bancaria_app/models/simulado_descricao.dart';
import 'package:formula_bancaria_app/models/simulado_descricao_colecao.dart';
import 'package:formula_bancaria_app/models/usuario.dart';
import 'package:formula_bancaria_app/services/base_service.dart';
import 'package:http/http.dart';

class UsuarioService extends BaseService{
  final String _resource  = "usuarios";

  Future<Usuario> gerarSimulado(int idUsuario) async {
    final token = Auth.token();
    final response = await get('$baseUrl/$_resource/${idUsuario.toString()}', 
      headers: { HttpHeaders.authorizationHeader: 'Bearer ' + token});

    if (response.statusCode == 200) {
      return Usuario.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erro ao buscar usuário');
    }
  }

  Future<SimuladoDescricaoColecao> getSimuladosUsuario(int idUsuario) async {
    final token = Auth.token();
    final response = await get('$baseUrl/$_resource/${idUsuario.toString()}/simulados', 
      headers: { HttpHeaders.authorizationHeader: 'Bearer ' + token});

    if (response.statusCode == 200) {
      return SimuladoDescricaoColecao.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erro ao buscar usuário');
    }
  }

}