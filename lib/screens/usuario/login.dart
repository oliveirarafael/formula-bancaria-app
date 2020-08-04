import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formula_bancaria_app/components/logo.dart';
import 'package:formula_bancaria_app/models/usuario.dart';
import 'package:formula_bancaria_app/screens/usuario/cadastro_usuario.dart';
import 'package:formula_bancaria_app/screens/usuario/esqueceu_senha.dart';
import 'package:formula_bancaria_app/services/api.dart';
import 'package:formula_bancaria_app/validators/validador.dart';

class FormularioLogin extends StatefulWidget {
  @override
  _FormularioLoginState createState() => _FormularioLoginState();
}

class _FormularioLoginState extends State<FormularioLogin> {
  final _loginFormKey = GlobalKey<FormState>();
  String _email, _senha;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: SingleChildScrollView(
            child: Form(
              key: _loginFormKey,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Logo(height: 100.0),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: _emailFormField(),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: _senhaFormField(),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: _linkEsqueceuSenha(),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: _botaoLogin(),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: _linkCadastrar(),
                  ),
                  //_botaoLoginGoogle(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailFormField() {
    return TextFormField(
      onSaved: (email) {
        this._email = email;
      },
      initialValue: "aluno@formulabancaria.com.br",
      validator: (email) {
        if (email.isEmpty) {
          return 'Campo Obrigatório';
        }

        if (ValidadorEmail.valido(email)) {
          return 'E-mail inválido';
        }

        return null;
      },
      keyboardType: TextInputType.emailAddress,
      obscureText: false,
      decoration: InputDecoration(
        hintText: "Email",
        prefixIcon: Icon(
          Icons.email,
        ),
      ),
      style: TextStyle(
        fontSize: 16,
      ),
    );
  }

  Widget _senhaFormField() {
    return TextFormField(
        onSaved: (senha) {
          this._senha = senha;
        },
        initialValue: '88418254',
        validator: (senha) {
          if (senha.isEmpty) {
            return 'Campo Obrigatório';
          }

          if (senha.length < 6) {
            return 'Deve ter mais que 5 caracteres';
          }

          return null;
        },
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
            hintText: "Senha", // Novo
            prefixIcon: Icon(
              Icons.lock,
            )),
        style: TextStyle(
          fontSize: 16,
        ));
  }

  Widget _botaoLogin() {
    return Container(
      height: 40.0,
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue[300],
        onPressed: () {
          var currentState = this._loginFormKey.currentState;
          if (currentState.validate()) {
            currentState.save();
            _login();
          }
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  Widget _botaoLoginGoogle() {
    return Container(
      height: 60.0,
      width: 250.0,
      child: RaisedButton(
        onPressed: () {
          var currentState = this._loginFormKey.currentState;
          if (currentState.validate()) {
            currentState.save();
            _login();
          }
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 300.0, minHeight: 60.0),
            alignment: Alignment.center,
            child: Text(
              "Login com o Google",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _login() {
    post(
      resource: 'auth',
      body: jsonEncode(
        Usuario(
          email: this._email,
          senha: this._senha,
        ),
      ),
    ).then((response) {
      if (response.statusCode == 200) {
        //if (UsuarioLogado.getUser().getEhAluno() &&
        //    UsuarioLogado.getUser().getAssinante()) {
        Navigator.pushNamed(context, '/aluno/dashboard');
        //}
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Usuário'),
              content: Text('Usuário inválido'),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      }
    }).catchError((erro) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Erro'),
            content: Text('$erro'),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    });
  }

  Widget _linkEsqueceuSenha() {
    return Container(
      height: 20,
      alignment: Alignment.centerRight,
      child: InkWell(
        child: Text(
          'Esqueceu sua senha?',
          style: TextStyle(
            fontSize: 15,
          ),
          textAlign: TextAlign.right,
        ),
        onTap: () => Navigator.pushNamed(context, EsqueceuSenha.routeName),
      ),
    );
  }

  Widget _linkCadastrar() {
    return Container(
      height: 20,
      alignment: Alignment.center,
      child: InkWell(
        child: Text(
          'Ainda não tem acesso? Cadastre-se',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        onTap: () => Navigator.pushNamed(context, CadastroUsuario.routeName),
      ),
    );
  }
}
