import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/components/logo.dart';
import 'package:formula_bancaria_app/models/usuario.dart';
import 'package:formula_bancaria_app/screens/simulado/lista.dart';
import 'package:formula_bancaria_app/services/api.dart';

class FormularioLogin extends StatefulWidget {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _senha = TextEditingController();

  @override
  _FormularioLoginState createState() => _FormularioLoginState();
}

class _FormularioLoginState extends State<FormularioLogin> {
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    this._context = context;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        child: Column(
          children: <Widget>[
            Logo(
              width: 220,
            ),
            _espacamento(20),
            _email(),
            _espacamento(10),
            _senha(),
            _espacamento(10),
            Row(
              children: <Widget>[
                _botaoLogin(),
                //_linkEsqueceuSenha(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _email() {
    return TextFormField(
      controller: widget._email,
      autofocus: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: "E-mail",
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

  Widget _senha() {
    return TextFormField(
      controller: widget._senha,
      autofocus: true,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
          labelText: "Senha",
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

  Widget _espacamento(double tamanho) {
    return SizedBox(
      height: tamanho,
    );
  }

  Widget _botaoLogin() {
    return RaisedButton(
      child: Text("Login"),
      onPressed: () {
        post(
          resource: 'auth',
          body: jsonEncode(Usuario('user@email.com.br', '123456')),
        ).then((response) {
          if (response.statusCode == 200) {
            Navigator.push(
              this._context,
              MaterialPageRoute(
                builder: (context) {
                  return ListaSimulados();
                },
              ),
            );
          } else {}
        }).catchError((erro) {
          debugPrint('Erro: $erro');
        });
      },
    );
  }

  Widget _linkEsqueceuSenha() {
    return Container(
      height: 20,
      child: FlatButton(
        child: Text(
          'Esqueceu sua senha?',
        ),
        onPressed: () {},
      ),
    );
  }
}
