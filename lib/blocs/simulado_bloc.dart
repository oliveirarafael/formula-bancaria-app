import 'dart:async';
import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:formula_bancaria_app/models/simulado.dart';
import 'package:formula_bancaria_app/services/api.dart' as api;

class SimuladoBloc {
  List<Simulado> _simulados = [];
  StreamController _streamController = StreamController();

  Stream<List<Simulado>> get stream =>
      _streamController.stream.asyncMap((value) => this._carregar());

  Future<List<Simulado>> _carregar() async {
    api.get('simulados').then((response) => {
        if(response.statusCode == api.STATUS_OK) {
          List json = jsonDecode(response.body)['content'];
          json.forEach((mapSimulado) {
            this._simulados.add(Simulado(
                  titulo: mapSimulado['titulo'],
                  descricao: mapSimulado['descricao'],
                ));
          });
        }
    }).catchError((erro) => debugPrint(erro));
    
    return await this._simulados;
  }
}
