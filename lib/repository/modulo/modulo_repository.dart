import 'dart:convert';

import 'package:formula_bancaria_app/models/modulo.dart';
import 'package:formula_bancaria_app/models/questao.dart';
import 'package:formula_bancaria_app/models/resposta.dart';
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
        );

        modulos.add(modulo);
      });
    }
    return modulos;
  }

  Future<Modulo> modulos(String moduloUUID) async {
    Modulo modulo = null;
    Response response = await api.get('modulos/$moduloUUID/questoes');

    if (response.statusCode == api.STATUS_OK) {
      Map json = jsonDecode(response.body);
      List<Questao> questoes = [];

      json['questoes'].forEach((mapQuestoes) => {
            questoes.add(
              Questao(
                uuid: mapQuestoes['uuid'],
                descricao: mapQuestoes['descricao'],
              ),
            )
          });
      modulo = Modulo(titulo: json['titulo'], questoes: questoes);
    }

    return modulo;
  }
}
