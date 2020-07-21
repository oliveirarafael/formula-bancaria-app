import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/components/logo.dart';
import 'package:formula_bancaria_app/components/modal/mensagem_dialog.dart';
import 'package:formula_bancaria_app/services/base_service.dart';
import 'package:http/http.dart';

class LembrarSenha extends StatefulWidget {
  @override
  _LembrarSenhaState createState() => _LembrarSenhaState();
}

class _LembrarSenhaState extends State<LembrarSenha> {
  BuildContext _context;
  String _email;
  final _lembrarSenhaFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    this._context = context;

    return Scaffold(
      body: SafeArea(child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: SingleChildScrollView(
          child: Form(
            key: _lembrarSenhaFormKey,
            child: Column(
              children: <Widget>[
                  SizedBox(height: 50),
                  Logo(height: 80.0),
                  SizedBox(height: 40),
                  _emailFormField(),
                  SizedBox(height: 20),
                  _botaoLembrarSenha(),
              ]),
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

  Widget _botaoLembrarSenha() {
    return Container(
      height: 60.0,
      width: 250.0,
      child: RaisedButton(
        onPressed: () {
            var currentState = this._lembrarSenhaFormKey.currentState;
            if (currentState.validate()) {
              currentState.save();
              _lembrarSenha();
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
              "Enviar",
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

  void _lembrarSenha() {
    BaseService service = new BaseService();
    post(
      '${service.baseUrl}/usuarios/lembrarSenha',
      headers: <String, String>{
        // 'Content-Type': 'application/json',
      },
      body: this._email,
    ).then((response) {
      MensagemDialog.show(context, mensagem: 'Verifique seu e-mail', funcao: () => closeModal(context));
    }).catchError((erro) {
      MensagemDialog.show(context, mensagem: 'Verifique seu e-mail', funcao: () => closeModal(context));
    });
  }

  bool closeModal(BuildContext context) {
    Navigator.pop(context);
    Navigator.pop(context);

    return true;
  }
}