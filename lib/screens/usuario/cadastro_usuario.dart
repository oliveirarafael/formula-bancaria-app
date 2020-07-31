import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/validators/validador.dart';

class CadastroUsuario extends StatelessWidget {
  static const routeName = '/usuario/cadastro';

  final _cadastroFormKey = GlobalKey<FormState>();
  String _nome, _email, _senha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastre-se"),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
          top: 40,
          left: 20,
          right: 20,
        ),
        child: ListView(children: <Widget>[
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset("assets/icons/add-user.png"),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Preencha os seus dados",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Form(
            key: this._cadastroFormKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                TextFormField(
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
                  decoration: InputDecoration(
                    labelText: "Nome",
                    prefixIcon: Icon(
                      Icons.account_circle,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  onSaved: (senha) {
                    this._senha = senha;
                  },
                  validator: (senha) {
                    if (senha.isEmpty) {
                      return 'Campo Obrigatório';
                    }

                    return null;
                  },
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  onSaved: (email) {
                    this._email = email;
                  },
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
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 60.0,
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.blue[300],
                    onPressed: () {
                      var currentState = this._cadastroFormKey.currentState;
                      if (currentState.validate()) {
                        currentState.save();
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      "Cadastrar",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
