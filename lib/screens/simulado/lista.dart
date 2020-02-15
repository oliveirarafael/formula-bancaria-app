import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/models/simulado.dart';
import 'package:formula_bancaria_app/screens/simulado/formulario.dart';
import 'package:formula_bancaria_app/services/api.dart';

class ListaSimulados extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListaSimuladoState();
  }
}

class _ListaSimuladoState extends State<ListaSimulados> {
  BuildContext _context;
  Future<List<Simulado>> _futureSimulados;

  @override
  void initState() {
    this._futureSimulados = _carregaSimulados();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    this._context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Simulados'),
      ),
      body: FutureBuilder(
        future: this._futureSimulados,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
            default:
              if (snapshot.hasData) {
                return _simuladosList(snapshot.data);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _formulario(),
      ),
    );
  }

  Widget _simuladosList(List<Simulado> simulados) {
    return ListView.builder(
      itemCount: simulados.length,
      itemBuilder: (context, posicao) {
        return _ItemSimulado(simulados[posicao]);
      },
    );
  }

  Function _formulario() {
    Navigator.push(
      this._context,
      MaterialPageRoute(builder: (context) {
        return FormularioSimulado();
      }),
    ).then((simulado) {
    });
  }

  Future<List<Simulado>> _carregaSimulados() async {
    List<Simulado> simulados = [];
    get('simulados').then((response) {
      if (response.statusCode == STATUS_OK) {
        List content = jsonDecode(response.body)['content'];
        content.forEach((mapSimulado) {
          simulados.add(Simulado(mapSimulado['titulo'], mapSimulado['descricao']));
        });
      }
    }).catchError((erro) {
      debugPrint('$erro');
    });

    return await Future.value(simulados);
  }
}

class _ItemSimulado extends StatelessWidget {
  final Simulado _simulado;

  _ItemSimulado(this._simulado);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.archive),
        title: Text(this._simulado.titulo),
        subtitle: Text(this._simulado.descricao),
      ),
    );
  }
}
