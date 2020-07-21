import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/components/centered_circular_progress.dart';
import 'package:formula_bancaria_app/components/centered_message.dart';
import 'package:formula_bancaria_app/components/modal/exibir_comentario.dart';
import 'package:formula_bancaria_app/components/modal/finish_dialog.dart';
import 'package:formula_bancaria_app/controllers/simulado_ativo_controller.dart';
import 'package:formula_bancaria_app/models/auth.dart';
import 'package:formula_bancaria_app/services/base_service.dart';
import 'package:http/http.dart';

class SimuladoAtivoPage extends StatefulWidget {
  @override
  _SimuladoAtivoPageState createState() => _SimuladoAtivoPageState();
}

class _SimuladoAtivoPageState extends State<SimuladoAtivoPage> {

  final _controller = SimuladoAtivoController();
  List<Widget> _scoreKeeper = [];
  bool _loading = true;
  bool _primeiraQuestao = true; // Primeira questão
  bool _ultimaQuestao = false;
  bool _corrigir = false;
  bool _podeResponder = true;

  int _respostaSelecionada = -1;

  Color _corRespostaSelecionada =  Colors.indigo;
  Color _corRespostaNaoSelecionada = Colors.blue;
  Color _corRespostaCerta = Colors.green;
  Color _corRespostaErrada = Colors.red;


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
      // appBar: AppBar(
      //   backgroundColor: Colors.grey.shade900,
      //   title: Text('QUIZ COVID-19 ( ${_scoreKeeper.length}/10 )'),
      //   centerTitle: true,
      //   elevation: 0.0,
      // ),
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
            //  child: SingleChildScrollView(
              // child: Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 0.0),
                child: _buildSimulado()
              // ),
            //  ),
          )
      );
  }

  _buildSimulado() {
    if (_loading) return CenteredCircularProgress();

    if (_controller.questionsNumber == 0)
      return CenteredMessage(
        'Sem questões',
        icon: Icons.warning,
      );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(children: <Widget>[
          Image.asset('assets/images/logo/logo-vertical-branca.png', height: 60.0),
          Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text('${_controller.nomeSimulado}', style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text('${_controller.getNumeroQuestao()}/${_controller.questionsNumber} questões', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ])
        ]),

        // SingleChildScrollView(child: Padding(padding: EdgeInsets.symmetric(horizontal: 0.0),
        //   child:  Column(children: <Widget>[
            _buildQuestao(_controller.getQuestion()),
            _buildAnswerButton(_controller.getAnswer1(), 0),
            _buildAnswerButton(_controller.getAnswer2(), 1),
            _buildAnswerButton(_controller.getAnswer3(), 2),
            _buildAnswerButton(_controller.getAnswer4(), 3),
        //   ]),
        // ),
        // ),
         

        _buildScoreKeeper(),

        _buildAcoes(_controller.getQuestion()),
      ],
    );
  }

  _buildQuestao(String question) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Center(
          child: Text(
            question,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  _buildAcoes(String question) {
    return 
    Container(
      margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 0),
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
        //  !_primeiraQuestao ? Center(child: IconButton(
        //     iconSize: 50.0,
        //     padding: EdgeInsets.only(bottom: 0.0),
        //     icon: Icon(Icons.arrow_left),//, size: 60.0), 
        //     color: Colors.white, 
        //     tooltip: 'Questão anterior',
        //     onPressed: (() {
        //       setState(() {
        //           // if (_controller.getNumeroQuestao() < _controller.questionsNumber) {
        //             _respostaSelecionada = -1;
        //             _controller.previousQuestion();
        //             _primeiraQuestao = _controller.primeiraQuestao();
        //             _ultimaQuestao = _controller.ultimaQuestao();
        //             _corrigir = false;
        //           // }
        //         });
        //     }),
        //   )) : Container(),
          OutlineButton(
            onPressed: () {
              // bool correct = _controller.correctAnswer(indexRespostaCorreta);
              ExibirComentarioDialog.show(
                context,
                question: _controller.question,
              );
            },
            padding: EdgeInsets.only(bottom: 0.0),
            borderSide: BorderSide(
                color: Colors.white,
                style: BorderStyle.solid,
            ),
            child: Text('Comentário', style: TextStyle(color: Colors.white, fontSize: 11))
          ),
            CircleAvatar(
            radius: 31, 
            backgroundColor: Colors.blue, 
            child: CircleAvatar(
              radius: 29,
              backgroundColor: Colors.white,
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/logo/logo-colorida.png'), // CircleAvatar(
              ),
            ),
          ),
          OutlineButton(
            onPressed:  (() {
              setState(() {
                _corrigir = true;
              });
            }),
            padding: EdgeInsets.only(bottom: 0.0),
            borderSide: BorderSide(
                color: Colors.white,
                style: BorderStyle.solid,
            ),
            child: Text('Responder', style: TextStyle(color: Colors.white, fontSize: 11))
          ),
          !_ultimaQuestao ? Center(child: IconButton(
              iconSize: 50.0,
              padding: EdgeInsets.only(bottom: 0.0),
              icon: Icon(Icons.arrow_right),//, size: 60.0), 
              color: Colors.white, 
              tooltip: 'Próxima questão', 
              onPressed: (() {
                setState(() {
                    // if (_controller.getNumeroQuestao() < _controller.questionsNumber) {
                      _podeResponder = true;
                      _respostaSelecionada = -1;
                      _controller.nextQuestion();
                      _primeiraQuestao = _controller.primeiraQuestao();
                      _ultimaQuestao = _controller.ultimaQuestao();
                      _corrigir = false;
                    // }
                  });
              }),
            )
          ) : Center(child: IconButton(
              iconSize: 50.0,
              padding: EdgeInsets.only(bottom: 0.0),
              icon: Icon(Icons.check_circle, color: Colors.green),//, size: 60.0), 
              color: Colors.green, 
              tooltip: 'Concluir', 
              onPressed: (() {_concluirSimulado(); }),
            )
          ),
        ],
      )
    );
  }

  _concluirSimulado() {
   
    BaseService service = new BaseService();
    
    post(
      '${service.baseUrl}/simuladosRespondidos',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + Auth.token()
      },
      body: jsonEncode(_controller.getSimuladoRespondido()),
    ).then((response) {
      if (response.statusCode == 201) {
        FinishDialog.show(
          context,
          hitNumber: _controller.hitNumber,
          numeroQuestoes: _controller.questionsNumber
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
            onPressed: () { },
          )
        ],
      );
    });
    _loading = true;
  }

  _buildAnswerButton(String answer, int indexRespostaCorreta) {
    return Expanded(
      // flex: 4,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.0),
        child: GestureDetector(
          child: Container(
            padding: EdgeInsets.all(6.0),
            color: _selectColorResponse(answer, indexRespostaCorreta),
            child: Center(
              child: AutoSizeText(
                answer,
                maxLines: 5,
                minFontSize: 12.0,
                maxFontSize: 24.0,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:  Colors.white,
                  fontSize: 20.0,
                ),
                overflow: TextOverflow.fade,
              ),
            ),
          ),
          onTap: () {
            if(_podeResponder)
            {
              setState(() => _respostaSelecionada = indexRespostaCorreta);
             _controller.armazenarQuestaoRespondida(indexRespostaCorreta);
            }
          },
        ),
      ),
    );
  }

  Color _selectColorResponse(String textoResposta,int indexRespostaCorreta) {
    // Busco id da questão
    var idQuestao = _controller.getQuestionId();

    // Busco a resposta selecionada pelo id da questão
    var textoRespostaSelecionada = _controller.getRespostaSelecionada(idQuestao);

    // // Caso não tenha resposta selecionada, a questão não foi respondida
    // if(textoRespostaSelecionada == null) 
    //   return _corRespostaNaoSelecionada;

    // Verificamos se é correção
    if(!_corrigir)
    {
      // Caso tenha resposta, verificamos se a resposta é a que estamos no momento
      if(textoResposta == textoRespostaSelecionada)
        return _corRespostaSelecionada;
      
      return _corRespostaNaoSelecionada;
    }
    else {
      if(textoResposta == textoRespostaSelecionada)
      {
        _podeResponder = false;
        if(_controller.verificarRespostaCerta(indexRespostaCorreta))
          return _corRespostaCerta;
        else
          return _corRespostaErrada;
      }
      
      return _corRespostaNaoSelecionada;
    }
  }

  _buildScoreKeeper() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _scoreKeeper,
      ),
    );
  }
}