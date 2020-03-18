import 'dart:convert';

import 'package:formula_bancaria_app/models/modulo.dart';
import 'package:formula_bancaria_app/models/simulado.dart';
import 'package:formula_bancaria_app/services/api.dart' as api;
import 'package:http/http.dart';

class ModuloRepository {
  
  Future<List<Modulo>> todos() async {
    List<Modulo> modulos = [];
    Response response = await api.get('modulos');

    if (response.statusCode == api.STATUS_OK) {
      List json = jsonDecode(response.body)['content'];
      json.forEach((mapSimulado) {
        Modulo modulo = Modulo(
          titulo: mapSimulado['titulo'],
          descricao: mapSimulado['descricao'],
        );

        modulos.add(modulo);
      });
    }
    return modulos;
  }
}
