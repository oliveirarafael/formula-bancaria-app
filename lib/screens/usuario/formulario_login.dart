import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formula_bancaria_app/components/logo.dart';
import 'package:formula_bancaria_app/models/usuario_login.dart';
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

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    
    return Scaffold(
      body: SafeArea(child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: SingleChildScrollView(
          child: Form(
            key: _loginFormKey,
            child: Column(
              children: <Widget>[
                  _espacamento(50),
                  Logo(
                  height: 80.0
                  ),
                  _espacamento(40),
                  _emailFormField(),
                  _espacamento(20),
                  _senhaFormField(),
                  _espacamento(10),
                  _linkEsqueceuSenha(),
                  _espacamento(30),
                  _botaoLogin(),
                  _espacamento(20),
                  _botaoLoginGoogle(),
                  _espacamento(25),
                  _linkCadastrar(),
                  _espacamento(25),
                  _marcaPatrocinador(),
                ],
              ),
            ),
          ),
        )
      )
    );
  }

  Widget _emailFormField() {
    return TextFormField(
      onSaved: (email) {
        this._email = email;
      },
      // initialValue: "aluno@formulabancaria.com.br",
      validator: (email) {
        if (email.isEmpty) {
          return 'Campo Obrigatório';
        }

        if (emailInvalido(email)) {
          return 'E-mail inválido';
        }

        return null;
      },
      keyboardType: TextInputType.emailAddress,
      obscureText: false,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Email",
          filled: true,                 // Novo
          fillColor: Color(0xFFDBEDFF), // Novo
          prefixIcon: Icon(Icons.email, color: Theme.of(context).scaffoldBackgroundColor),
          enabledBorder: OutlineInputBorder( // Novo
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder( // Novo
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      style: TextStyle(
        fontSize: 16,
        color: Theme.of(context).scaffoldBackgroundColor
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
      onSaved: (senha) {
        this._senha = senha;
      },
      // initialValue: '123456',
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
          border: InputBorder.none,
          hintText: "Senha",
          filled: true,                 // Novo
          fillColor: Color(0xFFDBEDFF), // Novo
          prefixIcon: Icon(Icons.lock, color: Theme.of(context).scaffoldBackgroundColor),
          enabledBorder: OutlineInputBorder( // Novo
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder( // Novo
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      style: TextStyle(
        fontSize: 16,
        color: Theme.of(context).scaffoldBackgroundColor
      ),
    );
  }

  Widget _espacamento(double tamanho) {
    return SizedBox(
      height: tamanho,
    );
  }

  Widget _botaoLogin() {
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
            color: Color(0xff0075ff),
            borderRadius: BorderRadius.circular(30.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 300.0, minHeight: 60.0),
            alignment: Alignment.center,
            child: Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
              ),
            ),
          ),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 300.0, minHeight: 60.0),
            alignment: Alignment.center,
            child: 
              Text(
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
        UsuarioLogin(
          this._email,
          this._senha,
        ),
      ),
    ).then((response) {
      if (response.statusCode == 200) {
        Navigator.pushNamed(this._context, '/aluno/menu');
        // if(UsuarioLogado.getUser() != null && UsuarioLogado.getUser().getEhAluno() && UsuarioLogado.getUser().getAssinante())
        // {
        //   Navigator.pushNamed(this._context, '/aluno/menu');
        // }
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
      debugPrint('Erro: $erro');
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
              color: Colors.white,
              fontSize: 15,
          ),
          textAlign: TextAlign.right,
        ),
        onTap: () {
          Navigator.pushNamed(this._context, '/aluno/lembrar_senha');
        },
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
              color: Colors.white,
              fontSize: 15,
          ),
        ),
        onTap: () {
          Navigator.pushNamed(this._context, '/aluno/cadastro');
        },
      ),
    );
  }

  Widget _marcaPatrocinador() {
    return Container(
      height: 70,
      alignment: Alignment.center,
       child: Row(children: <Widget>[
        Text(
          'Apoio',
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
          ),
        ),
        Image.asset('assets/icons/play.png', height: 70),
       ],
       mainAxisAlignment: MainAxisAlignment.center) ,
      // ),
    );
  }
  // Widget _marcaPatrocinador() {
  //   return Container(
  //     height: 50,
  //     alignment: Alignment.center,
  //     child: Row(children: <Widget>[
  //       Text(
  //         'Apoio',
  //         style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 30,
  //         ),
  //         textAlign: TextAlign.center,
  //       ),
  //       // Image.asset('assets/icons/user.png', )
  //     ],) 
  //   );
  // }
}
