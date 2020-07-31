import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/controllers/simulado_ativo_controller.dart';
import 'package:formula_bancaria_app/models/simulado_gerado.dart';
import 'package:formula_bancaria_app/models/simulado_respondido.dart';
import 'package:formula_bancaria_app/screens/dashboard/dashboard.dart';

class SimuladoConcluido extends StatelessWidget {
  static const routeName = '/aluno/simulado/concluido';

  SimuladoAtivoController _simuladoAtivoController;

  @override
  Widget build(BuildContext context) {
    this._simuladoAtivoController = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushNamed(context, Dashboard.routeName),
          ),
          title: Text("Resumo"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              this._icone(),
              this._simulado(),
              this._taxaAcerto(),
              this._legenda(),
              this._questoes(),
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
        color: Colors.blue[200],
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

  _legenda() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.done,
                  color: Colors.green,
                ),
                Text(
                  "Correta",
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.close,
                  color: Colors.red,
                ),
                Text(
                  "Errada",
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.done_all,
                  color: Colors.green,
                ),
                Text(
                  "Acertou",
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _questoes() {
    List<QuestaoSimuladoGerado> questoes =
        this._simuladoAtivoController.getSimuladoGerado().questoes;
    return Column(
      children: questoes
          .map(
            (q) => _ItemQuestaoGerada(q,
                this._simuladoAtivoController.getSimuladoRespondido().questoes),
          )
          .toList(),
    );
  }
}

class _ItemQuestaoGerada extends StatelessWidget {
  final QuestaoSimuladoGerado _questao;
  final List<QuestaoRespondida> _questoesrespondidas;
  bool _respostaCerta;

  _ItemQuestaoGerada(
    this._questao,
    this._questoesrespondidas,
  );

  @override
  Widget build(BuildContext context) {
    this._respostaCerta = this._ehRespostaCerta();
    return Card(
      color: this._respostaCerta ? Colors.green[50] : Colors.red[50],
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              this._questao.enunciado.trim(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: this._respostas(),
            ),
          )
        ],
      ),
    );
  }

  bool _ehRespostaCerta() {
    RespostaQuestaoSimuladoGerado respostaCerta =
        this._questao.respostas.where((r) => r.correta).first;

    return this
        ._questoesrespondidas
        .where((q) => respostaCerta.id == q.respostaEscolhidaId)
        .isNotEmpty;
  }

  List<Widget> _respostas() {
    return this
        ._questao
        .respostas
        .map(
          (r) => Row(
            children: <Widget>[
              Icon(
                r.correta
                    ? (this._respostaCerta ? Icons.done_all : Icons.done)
                    : Icons.close,
                color: r.correta ? Colors.green : Colors.red,
              ),
              Flexible(
                child: Text(
                  r.descricao,
                  style:
                      TextStyle(color: r.correta ? Colors.green : Colors.red),
                ),
              ),
            ],
          ),
        )
        .toList();
  }
}
