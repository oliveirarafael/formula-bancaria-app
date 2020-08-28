import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/screens/usuario/login.dart';

class CadastroSucesso extends StatelessWidget {
  static const routeName = '/usuario/cadastro/sucesso';
  Map<String, String> _argumentos;

  @override
  Widget build(BuildContext context) {
    this._argumentos = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrado com sucesso"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushNamed(context, "/"),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
          top: 40,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 120,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Cadastrado com sucesso",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                Text(
                  "Nome:",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(this._argumentos["nome"]),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Text(
                  "E-mail:",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(this._argumentos["email"]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
