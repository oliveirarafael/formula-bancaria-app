import 'package:flutter/material.dart';

class MenuHeaderDadosSimulado extends StatelessWidget {
  
  String nomeCertificacao;
  int numeroQuestaoAtiva;
  int numeroQuestoes;

  MenuHeaderDadosSimulado({
    @required this.nomeCertificacao,
    @required this.numeroQuestaoAtiva,
    @required this.numeroQuestoes,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(left: 18, top: 20, bottom: 5),
      width: 100,
      height: 50,
      child: Text(nomeCertificacao + ": " + numeroQuestaoAtiva.toString() + " de " + numeroQuestoes.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          backgroundColor: Colors.amber,
          fontSize: 20
        ),
      )
    );
  }
}