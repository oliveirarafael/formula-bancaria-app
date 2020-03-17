import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/models/simulado.dart';
import 'package:formula_bancaria_app/repository/simulado/simulado_repository.dart';
import 'package:formula_bancaria_app/screens/simulado/formulario.dart';


class ListaSimulados extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListaSimuladoState();
  }
}

class _ListaSimuladoState extends State<ListaSimulados> {
  BuildContext _context;
  SimuladoRepository repository = SimuladoRepository();

  @override
  Widget build(BuildContext context) {
    this._context = context;

    return Scaffold(
      appBar: AppBar(
        title: Text('Simulados'),
      ),
      body: FutureBuilder(
        future: this.repository.todos(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Text('Carregando dados...'),
              );
            case ConnectionState.done:
              if (snapshot.hasData) {
                return _simuladosList(snapshot.data);
              }
              return Center(
                child: Text('Não tem dados...'),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text('Ocorreu um erro...'),
                );
              }
              return Center(
                child: Text('Não tem dados...'),
              );
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
    Navigator.pushNamed(this._context, '/novo-simulado');
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
