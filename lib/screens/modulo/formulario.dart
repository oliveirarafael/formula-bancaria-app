import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/models/modulo.dart';
import 'package:formula_bancaria_app/models/simulado.dart';
import 'package:formula_bancaria_app/services/api.dart';

const _tituloAppBar = 'Novo Modulo';
const _labelCampoTitulo = 'Título';
const _labelCampoDescricao = 'Descrição';
const _textoBotaoContinuar = 'Continuar';

class FormularioModulo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioModuloState();
  }
}

class FormularioModuloState extends State<FormularioModulo> {
  String _titulo, _descricao;
  String _percentual;
  Simulado _simulado;
  BuildContext _context;
  final _moduloFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    this._context = context;
    this._simulado = ModalRoute.of(context).settings.arguments;
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
          key: this._moduloFormKey,
          child: Column(children: <Widget>[
            _tituloFormField(),
            _espacamento(20),
            _descricaoFormField(),
            _espacamento(20),
            _percentualFormField(),
            RaisedButton(
              child: Text(_textoBotaoContinuar),
              onPressed: () {
                _criaModulo();
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
      keyboardType: TextInputType.emailAddress,
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

  Widget _percentualFormField() {
    return TextFormField(
      onSaved: (percentual) {
        this._percentual = percentual;
      },
      validator: (percentual) {
        if (percentual.isEmpty) {
          return 'Campo Obrigatório';
        }
      },
      keyboardType: TextInputType.numberWithOptions(decimal: false, signed: false),
      decoration: InputDecoration(
          labelText: "Percentual",
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

  void _criaModulo() {
    var currentState = this._moduloFormKey.currentState;

    if(currentState.validate()) {
       currentState.save();

      post(
        resource: 'modulos',
        body: jsonEncode(
          Modulo(
            titulo: this._titulo,
            descricao: this._descricao,
            percentual: this._percentual,
            simuladoUUID: this._simulado.uuid,
          ),
        ),
      ).then((response) {
         if(response.statusCode == STATUS_CREATED){
            Navigator.pushNamed(this._context, '/simulados');
         }
      },).catchError((erro) {
          debugPrint('Erro: $erro');
      });
    }
  }
}
