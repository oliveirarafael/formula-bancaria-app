import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/components/alerta/alerta.dart';
import 'package:formula_bancaria_app/validators/validador.dart';
import 'package:formula_bancaria_app/services/api.dart';

class EsqueceuSenha extends StatefulWidget {
  static const routeName = '/usuario/esqueceu-senha';
  @override
  _EsqueceuSenhaState createState() => _EsqueceuSenhaState();
}

class _EsqueceuSenhaState extends State<EsqueceuSenha> {
  final _emailFormKey = GlobalKey<FormState>();
  String _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
          top: 60,
          left: 20,
          right: 20,
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 150,
              width: 150,
              child: Image.asset("assets/icons/reset-password-icon.png"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Esqueceu sua senha?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Por favor, informe o E-mail associado a sua conta que enviaremos uma senha provisória.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              key: this._emailFormKey,
              child: Column(
                children: <Widget>[
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
                        fontSize: 20,
                      ),
                    ),
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60.0,
                    width: double.infinity,
                    child: RaisedButton(
                      color: Colors.blue[300],
                      onPressed: () {
                        var currentState = this._emailFormKey.currentState;
                        if (currentState.validate()) {
                          currentState.save();
                          this._enviar();
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Text(
                        "Enviar",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _enviar() {
    this._email = this._email.toLowerCase().trim();
    get("usuarios/esqueceu-senha?email=${this._email}").then((response) {
      if (response.statusCode == 200) {
        Alerta.show(context, "Sua nova senha foi enviada para o seu E-mail");
      } else if (response.statusCode == 404) {
        Alerta.show(context, "Usuário não foi encontrado");
      }
    }).catchError((erro) {
      debugPrint("Erro: $erro");
      //Alerta.show(context, erro);
    });
  }
}
