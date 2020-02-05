import 'package:flutter/material.dart';

void main() => runApp(FormulaBancariaAPP());

class FormulaBancariaAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Simulados(),
    );
  }
}

class FormularioSimulado extends StatelessWidget {
  final TextEditingController _titulo = TextEditingController();
  final TextEditingController _descricao = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Simulado'),
      ),
      body: Column(children: <Widget>[
        Editor(
          controlador: _titulo,
          label: 'Titulo',
        ),
        Editor(
          controlador: _descricao,
          label: 'Descrição',
        ),
        RaisedButton(
          child: Text("Continuar"),
          onPressed: () {
            _criaSimulado(context);
          },
        ),
      ]),
    );
  }

  void _criaSimulado(BuildContext context) {
    String titulo = _titulo.text;
    String descricao = _descricao.text;
    
    if (titulo != null && descricao != null) {
      Navigator.pop(context, Simulado(titulo, descricao));
    }
  }

}

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String label;

  Editor({this.controlador, this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }
}

class Simulados extends StatefulWidget {
  final List<Simulado> _simulados = List();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SimuladoState();
  }

}

class SimuladoState extends State<Simulados>{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simulados'),
      ),
      body: ListView.builder(
        itemCount: widget._simulados.length,
        itemBuilder: (context, posicao) {
           final simulado = widget._simulados[posicao];
           debugPrint('Adicionando na Lista: $simulado');
           return ItemSimulado(simulado);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          final Future<Simulado> retorno = Navigator.push(context, MaterialPageRoute(builder: (context) {
               return FormularioSimulado();
          }));

          retorno.then((simulado) {
            debugPrint('$simulado');
            widget._simulados.add(simulado);
          });
        },
      ),
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

  @override
  String toString() {
    return '{ titulo: $titulo, descricao: $descricao }';
  }
}
