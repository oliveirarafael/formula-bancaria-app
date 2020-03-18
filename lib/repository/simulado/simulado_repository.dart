import 'dart:convert';

import 'package:formula_bancaria_app/models/simulado.dart';
import 'package:formula_bancaria_app/services/api.dart' as api;
import 'package:http/http.dart';

class SimuladoRepository {
  
  Future<List<Simulado>> todos() async {
    List<Simulado> simulados = [];
    Response response = await api.get('simulados');

    if (response.statusCode == api.STATUS_OK) {
      List json = jsonDecode(response.body)['content'];
      json.forEach((mapSimulado) {
        Simulado simulado = Simulado(
          titulo: mapSimulado['titulo'],
          descricao: mapSimulado['descricao'],
        );

        simulados.add(simulado);
      });
    }
    return simulados;
  }

  Future<Simulado> modulos(String simuladoUUID) async {
    Simulado simulado = null;
    Response response = await api.get('simulados/$simuladoUUID/modulos');

    if (response.statusCode == api.STATUS_OK) {
      List json = jsonDecode(response.body)['content'];
      json.forEach((mapSimulado) {
        print(mapSimulado);
        
        simulado = Simulado(
          titulo: mapSimulado['titulo'],
          modulos: mapSimulado['modulos'],
        );
      });
    }

    print(simulado);
    return simulado;
  }
}
