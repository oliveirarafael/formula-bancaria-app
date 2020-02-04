import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cadastro - Simulados'),
        ),
        body: Simulados(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
        ),
      ),
    ));

class Simulados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ItemSimulado(Simulado('CPA 10', 'Certificação do CPA 10'))
      ],
    );
  }
}

class ItemSimulado extends StatelessWidget {

  final Simulado _simulado;

  ItemSimulado(this._simulado);

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

class Simulado {
  final String titulo;
  final String descricao;

  Simulado(this.titulo, this.descricao);
}
