import 'dart:convert';
import 'dart:io';

import 'package:formula_bancaria_app/models/auth.dart';
import 'package:formula_bancaria_app/models/simulado_respondido.dart';
import 'package:formula_bancaria_app/models/simulado_respondido_estatistica.dart';
import 'package:formula_bancaria_app/models/usuario_logado.dart';
import 'package:formula_bancaria_app/services/base_service.dart';
import 'package:http/http.dart';


class SimuladoRespondidoService extends BaseService {
  final String _resource  = "simuladosRespondidos";

  Future<bool> concluirSimulado(SimuladoRespondido simuladoRespondido) async {
    final token = Auth.token();
    bool _boolResponse;
    post(
      '$baseUrl/$_resource',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + token
      },
      body: jsonEncode(simuladoRespondido),
    ).then((response) {
      if (response.statusCode == 201) {
        _boolResponse = true;
      } else {
        throw Exception('Erro ao salvar simulado');
      }
    });

    return _boolResponse;
  }

  Future<SimuladoRespondidoEstatistica> getEstatisticas(int simuladoId) async {
    final token = Auth.token();
    int usuarioId = UsuarioLogado.getUser().id;
    SimuladoRespondidoEstatistica _boolResponse;

    final response = await get(
      '$baseUrl/$_resource/usuarios/${usuarioId.toString()}/simulados/${simuladoId.toString()}',
      headers: { HttpHeaders.authorizationHeader: 'Bearer ' + token});

     if (response.statusCode == 200) {
      return new SimuladoRespondidoEstatistica.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}