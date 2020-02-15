import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/components/logo.dart';
import 'package:formula_bancaria_app/models/auth.dart';
import 'package:formula_bancaria_app/models/usuario.dart';
import 'package:formula_bancaria_app/screens/simulado/lista.dart';
import 'package:formula_bancaria_app/services/api.dart';

class FormularioLogin extends StatefulWidget {
  @override
  _FormularioLoginState createState() => _FormularioLoginState();
}

class _FormularioLoginState extends State<FormularioLogin> {
  BuildContext _context;
  final _loginFormKey = GlobalKey<FormState>();
  String _email, _senha;

  @override
  Widget build(BuildContext context) {
    this._context = context;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 60,
          left: 15,
          right: 40,
        ),
        child: Form(
          key: _loginFormKey,
          child: Column(
            children: <Widget>[
              Logo(
                width: 220,
              ),
              _espacamento(20),
              _emailFormField(),
              _espacamento(10),
              _senhaFormField(),
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
      ),
    );
  }

  Widget _emailFormField() {
    return TextFormField(
      //autofocus: true,
      onSaved: (email) {
        this._email = email;
      },
      validator: (email) {
        if (email.isEmpty) {
          return 'Campo Obrigatório';
        }

        if (emailInvalido(email)) {
          return 'E-mail inválido';
        }
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: "E-mail",
          icon: Icon(Icons.email),
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

  bool emailInvalido(String email) {
    return !RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  Widget _senhaFormField() {
    return TextFormField(
      //autofocus: true,
      onSaved: (senha) {
        this._senha = senha;
      },
      validator: (senha) {
        if (senha.isEmpty) {
          return 'Campo Obrigatório';
        }

        if (senha.length < 6) {
          return 'Deve ter mais que 5 caracteres';
        }
      },
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
          labelText: "Senha",
          icon: Icon(Icons.lock),
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
        if (this._loginFormKey.currentState.validate()) {
          this._loginFormKey.currentState.save();
          _login();
        }
      },
    );
  }

  void _login() {
    post(
      resource: 'auth',
      body: jsonEncode(Usuario(this._email, this._senha)),
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
      } else {
        showDialog(
          context: this._context,
          builder: (context) {
            return AlertDialog(
              title: Text('Usuário'),
              content: Text('Usuário inválido'),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      }
    }).catchError((erro) {
      debugPrint('Erro: $erro');
    });
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
