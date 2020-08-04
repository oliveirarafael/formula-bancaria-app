import 'dart:convert';
import 'dart:io';

import 'package:formula_bancaria_app/models/auth.dart';
import 'package:formula_bancaria_app/models/simulado_gerado.dart';
import 'package:http/http.dart';
import 'base_service.dart';

class SimuladoService extends BaseService {
  final String _baseUrl = 'https://formula-bancaria-api.herokuapp.com/api/v1';
  final String _resource = "simulados";

  Future<SimuladoGerado> gerarSimulado(int idSimulado) async {
    final token = Auth.token();
    final response = await get(
        '$_baseUrl/$_resource/${idSimulado.toString()}/gerar',
        headers: {HttpHeaders.authorizationHeader: 'Bearer ' + token});

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      return SimuladoGerado.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erro ao gerar simulado');
    }
  }
}
