import 'dart:async';
import 'dart:convert';

import 'package:formula_bancaria_app/models/simulado.dart';
import 'package:formula_bancaria_app/services/api.dart' as api;
import 'package:http/http.dart';

class SimuladoBloc {
  List<Simulado> _simulados = [];
  StreamController _streamController = StreamController();

  Stream<List<Simulado>> get stream =>
      _streamController.stream.asyncMap((value) => this._carregar());

  Future<List<Simulado>> _carregar() async {
    Response response = await api.get('simulados');

    if (response.statusCode == api.STATUS_OK) {
      List json = jsonDecode(response.body)['content'];

      json.forEach((mapSimulado) {
        this._simulados.add(Simulado(
              titulo: mapSimulado['titulo'],
              descricao: mapSimulado['descricao'],
            ));
      });
    }

    return this._simulados;
  }
}
