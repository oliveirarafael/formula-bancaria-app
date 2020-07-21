import 'package:flutter/material.dart';

class MenuHeaderQuestao extends StatelessWidget {

  String nomeCertificacao;
  int numeroQuestaoAtiva;
  int numeroQuestoes;

  MenuHeaderQuestao({
    @required this.nomeCertificacao,
    @required this.numeroQuestaoAtiva,
    @required this.numeroQuestoes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
        padding: EdgeInsets.only(left: 20, top: 10, right: 30, bottom: 30),
        child:  FittedBox(
          child: Row(children: <Widget>[
            Image.asset('assets/images/logo-horizontal-colorida-300x103.png', width: 200, fit: BoxFit.cover),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.grey,
                child: Text(nomeCertificacao + ": " + numeroQuestaoAtiva.toString() + " de " + numeroQuestoes.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20
                  )
                )
              ),
            ),
          ]),
        ),
      )
    ]);
  }
}