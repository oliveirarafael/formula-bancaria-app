import 'dart:convert';
import 'dart:io';

import 'package:formula_bancaria_app/models/auth.dart';
import 'package:formula_bancaria_app/models/simulado_respondido.dart';
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
}