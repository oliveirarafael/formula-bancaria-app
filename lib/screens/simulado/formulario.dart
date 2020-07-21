import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/models/simulado.dart';
import 'package:formula_bancaria_app/services/api.dart';

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

class FormularioSimuladoState extends State<FormularioSimulado> {
  String _titulo, _descricao;
  BuildContext _context;
  final _simuladoFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    this._context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 60,
          left: 15,
          right: 40,
        ),
        child: Form(
          key: this._simuladoFormKey,
          child: Column(children: <Widget>[
            _tituloFormField(),
            _espacamento(20),
            _descricaoFormField(),
            RaisedButton(
              child: Text(_textoBotaoContinuar),
              onPressed: () {
                _criaSimulado();
              },
            ),
          ]),
        ),
      ),
    );
  }

  Widget _espacamento(double tamanho) {
    return SizedBox(
      height: tamanho,
    );
  }

  Widget _tituloFormField() {
    return TextFormField(
      onSaved: (titulo) {
        this._titulo = titulo;
      },
      validator: (titulo) {
        if (titulo.isEmpty) {
          return 'Campo Obrigatório';
        }
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: "Título",
          labelStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black38,
          )),
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }

  Widget _descricaoFormField() {
    return TextFormField(
      onSaved: (descricao) {
        this._descricao = descricao;
      },
      validator: (descricao) {
        if (descricao.isEmpty) {
          return 'Campo Obrigatório';
        }
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: "Descrição",
          labelStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black38,
          )),
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }

  void _criaSimulado() {
    var currentState = this._simuladoFormKey.currentState;

    if (currentState.validate()) {
      currentState.save();

      post(
        resource: 'simulados',
        body: jsonEncode(
          Simulado(
            titulo: this._titulo,
            descricao: this._descricao,
          ),
        ),
      ).then(
        (response) {
          if (response.statusCode == STATUS_CREATED) {
            Map simuladoJson = jsonDecode(response.body);
            Navigator.pushNamed(
              this._context,
              '/simulado/modulos',
              arguments: Simulado(
                titulo: simuladoJson['titulo'],
                uuid: simuladoJson['uuid'],
              ),
            );
          }
        },
      ).catchError((erro) {
        debugPrint('Erro: $erro');
      });
    }
  }
}
