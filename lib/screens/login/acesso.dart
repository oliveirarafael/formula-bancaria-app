import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/components/editor.dart';
import 'package:formula_bancaria_app/components/logo.dart';

class Acesso extends StatelessWidget {
  final TextEditingController _login = TextEditingController();
  final TextEditingController _senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Logo(
                width: 220,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
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
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black38,
                    )),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  RaisedButton(
                    child: Text("Login"),
                    onPressed: () {},
                  ),
                  Container(
                    height: 40,
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      child: Text(
                        'Esqueceu sua senha?',
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    /*return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Logo(
                  width: 220.0,
                ),
                Editor(
                  controlador: this._login,
                  label: 'E-mail',
                  fontSize: 16.0,
                ),
                Editor(
                  controlador: this._senha,
                  label: 'Senha',
                  fontSize: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RaisedButton(
                      child: Text("Login"),
                      onPressed: () {},
                    ),
                    Text("Esqueceu a senha?"),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Ainda não possui uma conta?",
                  ),
                ),
                RaisedButton(
                  child: Text("Cadastre-se"),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );*/
  }
}
