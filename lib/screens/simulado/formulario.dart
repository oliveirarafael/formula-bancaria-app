import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/components/editor.dart';
import 'package:formula_bancaria_app/models/simulado.dart';

const _tituloAppBar = 'Novo Simulado';
const _labelCampoTitulo = 'Título';
const _labelCampoDescricao = 'Descrição';
const _textoBotaoContinuar = 'Continuar';

class FormularioSimulado extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioSimuladoState();
  }
  
}

class FormularioSimuladoState extends State<FormularioSimulado>{
  final TextEditingController _titulo = TextEditingController();
  final TextEditingController _descricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Editor(
            controlador: _titulo,
            label: _labelCampoTitulo,
          ),
          Editor(
            controlador: _descricao,
            label: _labelCampoDescricao,
          ),
          RaisedButton(
            child: Text(_textoBotaoContinuar),
            onPressed: () {
              _criaSimulado(context);
            },
          ),
        ]),
      ),
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
