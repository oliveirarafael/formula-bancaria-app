import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/components/alerta/alerta.dart';
import 'package:formula_bancaria_app/components/centered_circular_progress.dart';
import 'package:formula_bancaria_app/components/centered_message.dart';
import 'package:formula_bancaria_app/components/header.dart';
import 'package:formula_bancaria_app/controllers/simulado_ativo_controller.dart';
import 'package:formula_bancaria_app/models/auth.dart';
import 'package:formula_bancaria_app/screens/aluno/simulado/simulado_concluido.dart';
import 'package:formula_bancaria_app/screens/dashboard/dashboard.dart';
import 'package:formula_bancaria_app/services/base_service.dart';
import 'package:http/http.dart';

class SimuladoAtivoPage extends StatefulWidget {
  static const routeName = '/aluno/simulado/simulado-ativo';
  int _simuladoId = 0;

  SimuladoAtivoPage({@required int simuladoId}) {
    this._simuladoId = simuladoId;
  }

  @override
  _SimuladoAtivoPageState createState() => _SimuladoAtivoPageState();
}

class _SimuladoAtivoPageState extends State<SimuladoAtivoPage> {
  final _controller = SimuladoAtivoController();
  bool _loading = true;

  int _respostaSelecionada = -1;
  bool _questaoRespondida = false;
  bool _acertou = false;

  Future<void> _initialize() async {
    await _controller.initialize(widget._simuladoId);

    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header().get(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.popAndPushNamed(context, Dashboard.routeName),
        ),
      ),
      body: this._buildSimulado(),
      bottomNavigationBar: this._rodape(),
      floatingActionButton: this.botaoResponder(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget botaoResponder() {
    if (_loading) return null;

    if (_controller.questionsNumber == 0) return null;

    return FloatingActionButton(
      backgroundColor:
          this._questaoRespondida ? Colors.grey : Color(0xFF2A2F52),
      child: Icon(
        Icons.done,
      ),
      onPressed: this._questaoRespondida ? null : this._responder,
    );
  }

  _buildSimulado() {
    if (_loading) return CenteredCircularProgress();

    if (_controller.questionsNumber == 0)
      return CenteredMessage(
        'Sem questões',
        icon: Icons.warning,
      );

    return ListView(
      children: [
        Container(
          color: Color(0xFF2A2F52),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 40),
                    padding: EdgeInsets.all(25),
                    child: Text(
                      this._controller.nomeSimulado,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: this._questaoRespondida
                          ? this._acertou ? Colors.green : Colors.red
                          : Colors.amberAccent[700],
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    child: IconButton(
                      onPressed: this._questaoRespondida
                          ? () => debugPrint("Reportar Questão")
                          : null,
                      icon: Icon(
                        Icons.report,
                        color: this._questaoRespondida
                            ? Colors.white
                            : Color(0xFF2A2F52),
                        size: 32,
                      ),
                      tooltip: "Reportar questão errada",
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(top: 12, right: 23),
                      child: Text(
                        '${_controller.getNumeroQuestao()}/${_controller.questionsNumber} questões',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    _questao(_controller.getQuestion()),
                    _resposta(_controller.getAnswer1(), 0,
                        _controller.verificarRespostaCerta(0)),
                    _resposta(_controller.getAnswer2(), 1,
                        _controller.verificarRespostaCerta(1)),
                    _resposta(_controller.getAnswer3(), 2,
                        _controller.verificarRespostaCerta(2)),
                    _resposta(_controller.getAnswer4(), 3,
                        _controller.verificarRespostaCerta(3)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _rodape() {
    if (_loading) return null;

    if (_controller.questionsNumber == 0) return null;

    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: this._exibirComentario,
            icon: Icon(
              Icons.comment,
              color: Color(0xFF2A2F52),
            ),
            tooltip: "Cometário",
          ),
          IconButton(
            onPressed: this._questaoRespondida ? this._proximaQuestao : null,
            icon: Icon(
              Icons.arrow_forward,
              color: this._questaoRespondida ? Color(0xFF2A2F52) : Colors.white,
            ),
            tooltip: "Próxima Questão",
          ),
        ],
      ),
    );
  }

  Widget _questao(String question) {
    return Container(
      padding: EdgeInsets.all(25.0),
      child: Center(
        child: Text(
          question,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  _resposta(String answer, int indexResposta, bool correta) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: this._questaoRespondida
            ? Border.all(
                color: correta ? Colors.green : Colors.red,
                width: 1,
              )
            : null,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: RadioListTile<int>(
        activeColor: Color(0xFF2A2F52),
        title: Text(
          answer.trim(),
          textAlign: TextAlign.left,
        ),
        value: indexResposta,
        groupValue: this._respostaSelecionada,
        onChanged: this._questaoRespondida ? null : this._selecionaResposta,
      ),
    );
  }

  _responder() {
    if (this._respostaSelecionada < 0) {
      Alerta.show(context, "Selecione uma resposta");
    } else if (this._controller.ultimaQuestao()) {
      this._controller.armazenarQuestaoRespondida(this._respostaSelecionada);
      setState(() {
        this._questaoRespondida = true;
        this._acertou =
            this._controller.verificarRespostaCerta(this._respostaSelecionada);
      });
      this._concluirSimulado();
    } else {
      this._controller.armazenarQuestaoRespondida(this._respostaSelecionada);
      setState(() {
        this._questaoRespondida = true;
        this._acertou =
            this._controller.verificarRespostaCerta(this._respostaSelecionada);
      });
    }
  }

  _proximaQuestao() {
    if (this._questaoRespondida) {
      setState(() {
        this._respostaSelecionada = -1;
        this._controller.nextQuestion();
        this._questaoRespondida = false;
      });
    }
  }

  _exibirComentario() {
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (context) =>
            AlertaFullScreen(this._controller.getComentario()),
        fullscreenDialog: true,
      ),
    );
  }

  _concluirSimulado() {
    BaseService service = new BaseService();
    Alerta.bloqueio(context, "Aguarde...");

    post(
      '${service.baseUrl}/simuladosRespondidos',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + Auth.token()
      },
      body: jsonEncode(_controller.getSimuladoRespondido()),
    ).then((response) {
      debugPrint("Simulado Respondido: ${_controller.getSimuladoRespondido()}");
      if (response.statusCode == 201) {
        Navigator.pushNamed(
          context,
          SimuladoConcluido.routeName,
          arguments: this._controller,
        );
      } else {
        throw Exception(
            'Erro ao salvar simulado, status ${response.statusCode}, mensagem ${response.body}');
      }
    }).catchError((erro) {
      debugPrint('Erro: $erro');
      AlertDialog alert = AlertDialog(
        title: Text("Alerta"),
        content: Text("Simulado não pôde ser salvo"),
        actions: [
          FlatButton(
            child: Text("OK"),
            onPressed: () {},
          )
        ],
      );
    });
  }

  void _selecionaResposta(int valor) {
    setState(() {
      this._respostaSelecionada = valor;
    });
  }
}
