import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/models/simulado.dart';
import 'package:formula_bancaria_app/screens/simulado/formulario.dart';

class ListaSimulados extends StatefulWidget {
  final List<Simulado> _simulados = List();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListaSimuladoState();
  }
}

class ListaSimuladoState extends State<ListaSimulados> {
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    this._context = context;

    return Scaffold(
      appBar: AppBar(
        title: Text('Simulados'),
      ),
      body: ListView.builder(
        itemCount: widget._simulados.length,
        itemBuilder: (context, posicao) {
          return ItemSimulado(widget._simulados[posicao]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _formulario(),
      ),
    );
  }

  Function _formulario() {
    Navigator.push(
      this._context,
      MaterialPageRoute(builder: (context) {
        return FormularioSimulado();
      }),
    ).then(
      (simulado) => _atualiza(simulado),
    );
  }

  void _atualiza(simulado) {
    if (simulado != null) {
      setState(() {
        widget._simulados.add(simulado);
      });
    }
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
