// import 'package:formula_bancaria_app/models/questao_ativa.dart';
// import 'package:formula_bancaria_app/models/question.dart';
import 'package:formula_bancaria_app/models/simulado_gerado.dart';
import 'package:formula_bancaria_app/models/simulado_respondido.dart';
import 'package:formula_bancaria_app/models/usuario_logado.dart';
// import 'package:formula_bancaria_app/services/quiz_api.dart';
import 'package:formula_bancaria_app/services/simulado_service.dart';

class SimuladoAtivoController {
  SimuladoGerado _simuladoGerado;
  SimuladoRespondido _simuladoRespondido;
  List<QuestaoSimuladoGerado> _questoesPlanilha;
  int _questaoIndex = 0;
  int hitNumber = 0;

  int questionsNumber = 0;
  QuestaoSimuladoGerado question;
  String nomeSimulado;

  Future<void> initialize(int simuladoId) async {
    //int simuladoId = 1;
    int usuarioId = UsuarioLogado.getUser().id;
    _simuladoGerado = await gerarSimuladoParaResponder(simuladoId);
    _simuladoRespondido = SimuladoRespondido(simuladoId, usuarioId, null);

    _questaoIndex = 0;
    hitNumber = 0;

    _questoesPlanilha = _simuladoGerado.questoes;
    nomeSimulado = _simuladoGerado.titulo;

    if (_questoesPlanilha.isNotEmpty) {
      questionsNumber = _questoesPlanilha.length;
      question = _questoesPlanilha[_questaoIndex];
    }

    print('Número de questões: ${_simuladoGerado.questoes.length}');
  }

  void nextQuestion() {
    _questaoIndex++;
  }

  void previousQuestion() {
    _questaoIndex--;
  }

  bool primeiraQuestao() {
    return (_questaoIndex <= 0);
  }

  bool ultimaQuestao() {
    return (_questaoIndex == (questionsNumber - 1));
  }

  String getQuestion() {
    return _questoesPlanilha[_questaoIndex].enunciado;
  }

  String getComentario() {
    return _questoesPlanilha[_questaoIndex].comentario;
  }

  int getQuestionId() {
    return _questoesPlanilha[_questaoIndex].id;
  }

  String getAnswer1() {
    return _questoesPlanilha[_questaoIndex].respostas[0].descricao;
  }

  String getAnswer2() {
    return _questoesPlanilha[_questaoIndex].respostas[1].descricao;
  }

  String getAnswer3() {
    return _questoesPlanilha[_questaoIndex].respostas[2].descricao;
  }

  String getAnswer4() {
    return _questoesPlanilha[_questaoIndex].respostas[3].descricao;
  }

  bool correctAnswer(int indexRespostaEscolhida) {
    var correct = (_questoesPlanilha[_questaoIndex]
        .respostas[indexRespostaEscolhida]
        .correta);
    hitNumber = hitNumber + (correct ? 1 : 0);
    return correct;
  }

  void armazenarQuestaoRespondida(int indexRespostaEscolhida) {
    int questaoRespondida = _questoesPlanilha[_questaoIndex].id;
    int respostaEscolhida =
        _questoesPlanilha[_questaoIndex].respostas[indexRespostaEscolhida].id;

    if (_simuladoRespondido.questoes == null) {
      _simuladoRespondido.questoes = List<QuestaoRespondida>();
    }

    if (_simuladoRespondido.questoes != null &&
        _simuladoRespondido.questoes
            .any((q) => q.questaoId == questaoRespondida)) {
      _simuladoRespondido.questoes
          .where((q) => q.questaoId == questaoRespondida)
          .first
          .respostaEscolhidaId = respostaEscolhida;
    } else {
      _simuladoRespondido.questoes
          .add(new QuestaoRespondida(questaoRespondida, respostaEscolhida));

      if (_questoesPlanilha[_questaoIndex]
          .respostas[indexRespostaEscolhida]
          .correta) {
        hitNumber++;
      }
    }
  }

  String getRespostaSelecionada(idQuestao) {
    if (_simuladoRespondido == null) return null;

    if (_simuladoRespondido.questoes == null) return null;

    if (!_simuladoRespondido.questoes.any((q) => q.questaoId == idQuestao))
      return null;

    var questaoRespondida = _simuladoRespondido.questoes
        .firstWhere((q) => q.questaoId == idQuestao);

    if (questaoRespondida == null) return null;

    var respostaEscolhidaId = questaoRespondida.respostaEscolhidaId;

    var respostaEscolhida = _questoesPlanilha[_questaoIndex]
        .respostas
        .firstWhere((r) => r.id == respostaEscolhidaId);

    if (respostaEscolhida == null) return null;

    return respostaEscolhida.descricao;
  }

  Future<SimuladoGerado> gerarSimuladoParaResponder(int id) async {
    return SimuladoService().gerarSimulado(id);
  }

  // Future<bool> concluirSimulado() async {
  //   // return SimuladoRespondidoService().concluirSimulado(_simuladoRespondido);

  //   // return response;
  //   BaseService service = new BaseService();

  //   final token = Auth.token();
  //   bool _boolResponse;
  //   String resource = "simuladosRespondidos";

  // }

  SimuladoRespondido getSimuladoRespondido() {
    return _simuladoRespondido;
  }

  SimuladoGerado getSimuladoGerado() {
    return this._simuladoGerado;
  }

  int getNumeroQuestao() {
    return _questaoIndex + 1;
  }

  bool verificarRespostaCerta(int indexResposta) {
    return _questoesPlanilha[_questaoIndex].respostas[indexResposta].correta;
  }
}
