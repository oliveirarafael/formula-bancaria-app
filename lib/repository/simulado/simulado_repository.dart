import 'dart:convert';

import 'package:formula_bancaria_app/models/modulo.dart';
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
      Map json = jsonDecode(response.body);
      List<Modulo> modulos = [];

      json['modulos'].forEach((mapModulos) => {
            modulos.add(
              Modulo(
                uuid: mapModulos['uuid'],
                titulo: mapModulos['titulo'],
                percentual: mapModulos['percentual'].toString(),
              ),
            )
          });
      simulado = Simulado(titulo: json['titulo'], modulos: modulos);
    }

    return simulado;
  }
}
