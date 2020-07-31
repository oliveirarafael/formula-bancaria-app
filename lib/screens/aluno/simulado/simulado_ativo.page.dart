import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/components/alerta/alerta.dart';
import 'package:formula_bancaria_app/components/centered_circular_progress.dart';
import 'package:formula_bancaria_app/components/centered_message.dart';
import 'package:formula_bancaria_app/controllers/simulado_ativo_controller.dart';
import 'package:formula_bancaria_app/models/auth.dart';
import 'package:formula_bancaria_app/screens/aluno/simulado/simulado_concluido.dart';
import 'package:formula_bancaria_app/services/base_service.dart';
import 'package:http/http.dart';

class SimuladoAtivoPage extends StatefulWidget {
  static const routeName = '/aluno/simulado/simulado-ativo';

  @override
  _SimuladoAtivoPageState createState() => _SimuladoAtivoPageState();
}

class _SimuladoAtivoPageState extends State<SimuladoAtivoPage> {
  final _controller = SimuladoAtivoController();
  bool _loading = true;

  int _respostaSelecionada = -1;

  Future<void> _initialize() async {
    await _controller.initialize();

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
      appBar: this._cabecalho(),
      body: this._buildSimulado(),
      bottomNavigationBar: this._rodape(),
      floatingActionButton: this.botaoResponder(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _cabecalho() {
    if (_loading) return null;

    return AppBar(
      title: Center(
        child: this._titulo(),
      ),
    );
  }

  Widget botaoResponder() {
    if (_loading) return null;

    return FloatingActionButton(
      child: Icon(
        Icons.done,
      ),
      onPressed: this._responder,
    );
  }

  Widget _titulo() {
    return Text(
      '${_controller.getNumeroQuestao()}/${_controller.questionsNumber} questões',
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
      children: <Widget>[
        _questao(_controller.getQuestion()),
        _resposta(_controller.getAnswer1(), 0),
        _resposta(_controller.getAnswer2(), 1),
        _resposta(_controller.getAnswer3(), 2),
        _resposta(_controller.getAnswer4(), 3),
      ],
    );
  }

  Widget _rodape() {
    if (_loading) return null;

    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: this._exibirComentario,
            icon: Icon(
              Icons.comment,
            ),
            tooltip: "Cometário",
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

  _resposta(String answer, int indexRespostaCorreta) {
    return Container(
      padding: EdgeInsets.all(10),
      child: RadioListTile<int>(
        title: Text(
          answer.trim(),
          textAlign: TextAlign.left,
        ),
        value: indexRespostaCorreta,
        groupValue: this._respostaSelecionada,
        onChanged: this._selecionaResposta,
      ),
    );
  }

  _responder() {
    if (this._respostaSelecionada < 0) {
      Alerta.show(context, "Selecione uma resposta");
    } else if (this._controller.ultimaQuestao()) {
      this._controller.armazenarQuestaoRespondida(this._respostaSelecionada);
      this._concluirSimulado();
    } else {
      this._controller.armazenarQuestaoRespondida(this._respostaSelecionada);
      this._proximaQuestao();
    }
  }

  _proximaQuestao() {
    setState(() {
      _respostaSelecionada = -1;
      _controller.nextQuestion();
    });
  }

  _exibirComentario() {
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (context) =>
            AlertaFullScreen(this._controller.question.comentario),
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
      if (response.statusCode == 201) {
        Navigator.pushNamed(
          context,
          SimuladoConcluido.routeName,
          arguments: this._controller,
        );
      } else {
        throw Exception('Erro ao salvar simulado');
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
