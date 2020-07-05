import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SimuladoGerado {
  final int id;
  final String uuid;
  final String titulo;
  final int quantidadeQuestoesExecucao;
  final List<QuestaoSimuladoGerado> questoes;

  SimuladoGerado({this.id, this.uuid, this.titulo, this.quantidadeQuestoesExecucao, this.questoes});

  factory SimuladoGerado.fromJson(Map<String, dynamic> json) {
    return SimuladoGerado(
      id: json['id'],
      uuid: json['uuid'],
      titulo: json['titulo'],
      quantidadeQuestoesExecucao: json['quantidadeQuestoesExecucao'],
      questoes: List<QuestaoSimuladoGerado>.from(json["questoes"].map((x) => QuestaoSimuladoGerado.fromJson(x)))
    );
  }
}

class QuestaoSimuladoGerado {
  final int id;
  final String uuid;
  final String assunto;
  final String enunciado;
  final String comentario;
  final List<RespostaQuestaoSimuladoGerado> respostas;

  QuestaoSimuladoGerado({this.id, this.uuid, this.assunto, this.enunciado, this.comentario, this.respostas});

  factory QuestaoSimuladoGerado.fromJson(Map<String, dynamic> json) {
    return QuestaoSimuladoGerado(
      id: json['id'],
      uuid: json['uuid'],
      assunto: json['assunto'],
      enunciado: json['enunciado'],
      comentario: json['comentario'],
      respostas: List<RespostaQuestaoSimuladoGerado>.from(json["respostas"].map((x) => RespostaQuestaoSimuladoGerado.fromJson(x)))
    );
  }
}

class RespostaQuestaoSimuladoGerado {
  final int id;
  final String uuid;
  final String descricao;
  final bool correta;

  RespostaQuestaoSimuladoGerado({this.id, this.uuid, this.descricao, this.correta});

  factory RespostaQuestaoSimuladoGerado.fromJson(Map<String, dynamic> json) {
    return RespostaQuestaoSimuladoGerado(
      id: json['id'],
      uuid: json['uuid'],
      descricao: json['descricao'],
      correta: json['correta'],
    );
  }
}