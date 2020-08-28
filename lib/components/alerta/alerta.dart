import 'package:flutter/material.dart';

class Alerta {
  static Future<void> show(context, mensagem) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Icon(Icons.info),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Center(
                  child: Text(mensagem),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> bloqueio(context, mensagem) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Icon(Icons.info),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Center(
                  child: Text(mensagem),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AlertaFullScreen extends StatelessWidget {
  String _mensagem = "";
  AlertaFullScreen(mensagem) {
    this._mensagem = mensagem;
  }

  @override
  Widget build(BuildContext context) {
    // Remove the MediaQuery padding because the demo is rendered inside of a
    // different page that already accounts for this padding.
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF2A2F52),
          title: Text("Comentário"),
        ),
        body: SafeArea(
          child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.only(bottom: 25),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF2A2F52),
                      ),
                      child: Icon(
                        Icons.comment,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  Text(
                    this._mensagem,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              )),
        ));
  }
}
