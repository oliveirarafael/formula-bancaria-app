import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/components/logo.dart';
import 'package:formula_bancaria_app/components/modal/mensagem_dialog.dart';
import 'package:formula_bancaria_app/models/novo_usuario.dart';
import 'package:formula_bancaria_app/services/base_service.dart';
import 'package:http/http.dart';

class UsuarioCadastro extends StatefulWidget {
  @override
  _UsuarioCadastroState createState() => _UsuarioCadastroState();
}

class _UsuarioCadastroState extends State<UsuarioCadastro> {
  BuildContext _context;
  final _cadastroFormKey = GlobalKey<FormState>();
  String _nome;
  String _email;
  String _senha;
  String _confirmarSenha;

  @override
  Widget build(BuildContext context) {
    this._context = context;

    return Scaffold(
      body: SafeArea(child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: SingleChildScrollView(
          child: Form(
            key: _cadastroFormKey,
            child: Column(
              children: <Widget>[
                  SizedBox(height: 50),
                  Logo(height: 80.0),
                  SizedBox(height: 40),
                  _nomeFormField(),
                  SizedBox(height: 20),
                  _emailFormField(),
                  SizedBox(height: 20),
                  _senhaFormField(),
                  SizedBox(height: 20),
                  _confirmarSenhaFormField(),
                  SizedBox(height: 20),
                  _botaoCadastro(),
              ]),
            ),
          ),
        )
      )
    );
  }

  Widget _nomeFormField() {
    return TextFormField(
      onSaved: (nome) {
        this._nome = nome;
      },
      validator: (nome) {
        if (nome.isEmpty) {
          return 'Campo Obrigatório';
        }

        return null;
      },
      keyboardType: TextInputType.text,
      obscureText: false,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Nome",
          filled: true,                 // Novo
          fillColor: Color(0xFFDBEDFF), // Novo
          prefixIcon: Icon(Icons.person, color: Theme.of(context).scaffoldBackgroundColor),
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

  Widget _emailFormField() {
    return TextFormField(
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

  Widget _senhaFormField() {
    return TextFormField(
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

  Widget _confirmarSenhaFormField() {
    return TextFormField(
      onSaved: (senha) {
        this._confirmarSenha = senha;
      },
      validator: (senha) {
        if (senha.isEmpty) {
          return 'Campo Obrigatório';
        }

        if (senha.length < 6) {
          return 'Deve ter mais que 5 caracteres';
        }

        // if (_senha != this._confirmarSenha) {
        //   return 'As senhas não conferem';
        // }


        return null;
      },
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Confirmar senha",
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

  Widget _campoSenha(String referencia, String hintText) {
    return TextFormField(
      onSaved: (senha) {
        referencia = senha;
      },
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
          hintText: hintText,
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

  Widget _botaoCadastro() {
    return Container(
      height: 60.0,
      width: 250.0,
      child: RaisedButton(
        onPressed: () {
            var currentState = this._cadastroFormKey.currentState;
            if (currentState.validate()) {
              currentState.save();
              _cadastrar();
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
              "Cadastrar",
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

  bool emailInvalido(String email) {
    return !RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  void showMensagemErro() {
      showDialog(
      context: this._context,
      builder: (context) {
        return AlertDialog(
          title: Text('Usuário'),
          content: Text('Não foi possível salvar o usuário'),
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

  void _cadastrar() {
    BaseService service = new BaseService();
    post(
      '${service.baseUrl}/usuarios/alunos',
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(NovoUsuario(nome: this._nome, email: this._email, senha: this._senha)),
    ).then((response) {
      if (response.statusCode == 201) {
        MensagemDialog.show(context, mensagem: 'Usuário cadastrado com sucesso', funcao: () => closeModal(context));
      } else {
        showMensagemErro();
      }
    }).catchError((erro) {
      print('Erro: ' + erro);
      showMensagemErro();
    });
  }

  bool closeModal(BuildContext context)
  {
    Navigator.pop(context);
    Navigator.pop(context);

    return true;
  }
}