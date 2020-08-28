import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/components/header.dart';
import 'package:formula_bancaria_app/controllers/simulado_ativo_controller.dart';
import 'package:formula_bancaria_app/screens/dashboard/dashboard.dart';

class SimuladoConcluido extends StatelessWidget {
  static const routeName = '/aluno/simulado/concluido';

  SimuladoAtivoController _simuladoAtivoController;

  @override
  Widget build(BuildContext context) {
    this._simuladoAtivoController = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: Header().get(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () =>
                Navigator.popAndPushNamed(context, Dashboard.routeName),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              this._icone(),
              this._simulado(),
              this._taxaAcerto(),
              LinearProgressIndicator(
                value: 0.4,
                backgroundColor: Colors.amber,
              )
            ],
          ),
        ));
  }

  _icone() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Icon(
        Icons.class_,
        size: 100,
        color: Color(0xFF2A2F52),
      ),
    );
  }

  _simulado() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Text(
        this._simuladoAtivoController.getSimuladoGerado().titulo,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color(0xFF2A2F52),
        ),
      ),
    );
  }

  _taxaAcerto() {
    int quantidadeQuestoes = this._simuladoAtivoController.questionsNumber;
    int quantidadeQuestoesCertas = this._simuladoAtivoController.hitNumber;
    int percentual =
        ((quantidadeQuestoesCertas / quantidadeQuestoes) * 100).round();

    return Padding(
      padding: EdgeInsets.all(15),
      child: Text(
          "Você acertou $percentual% ($quantidadeQuestoesCertas de $quantidadeQuestoes)"),
    );
  }
}
