import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SimuladoRespondido {
  final int simuladoId;
  final int usuarioId;
  List<QuestaoRespondida> questoes;

  SimuladoRespondido(this.simuladoId, this.usuarioId, this.questoes);

  Map<String, dynamic> toJson() {
    return {
      "simuladoId": this.simuladoId,
      "usuarioId": this.usuarioId,
      "questoes": this.questoes
    };
  }

  @override
  String toString() {
    return '{usuarioId: $usuarioId, simuladoId: $simuladoId}';
  }
}

@JsonSerializable()
class QuestaoRespondida {
  final int questaoId;
  int respostaEscolhidaId;

  QuestaoRespondida(this.questaoId, this.respostaEscolhidaId);

  Map<String, dynamic> toJson() {
    return {
      "questaoId": this.questaoId,
      "respostaEscolhidaId": this.respostaEscolhidaId
    };
  }
}
