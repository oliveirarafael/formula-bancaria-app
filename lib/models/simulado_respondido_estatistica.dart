import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SimuladoRespondidoEstatistica {
  final String simulado;
  final List<SimuladoRespondidoEstatisticaItem> estatisticasPorSimulados;
  final List<SimuladoRespondidoEstatisticaModuloItem> estatisticasPorModulos;

  SimuladoRespondidoEstatistica({this.simulado, this.estatisticasPorSimulados, this.estatisticasPorModulos});

  factory SimuladoRespondidoEstatistica.fromJson(Map<String, dynamic> json) {
    return SimuladoRespondidoEstatistica(
      simulado: json['simulado'],
      estatisticasPorSimulados: List<SimuladoRespondidoEstatisticaItem>.from(json["estatisticasPorSimulados"].map((x) => SimuladoRespondidoEstatisticaItem.fromJson(x))),
      estatisticasPorModulos: List<SimuladoRespondidoEstatisticaModuloItem>.from(json["estatisticasPorModulos"].map((x) => SimuladoRespondidoEstatisticaModuloItem.fromJson(x)))
    );
  }
}

class SimuladoRespondidoEstatisticaItem {
  final DateTime data;
  final double percentualAcertos;

  SimuladoRespondidoEstatisticaItem({this.data, this.percentualAcertos});

  factory SimuladoRespondidoEstatisticaItem.fromJson(Map<String, dynamic> json) {
    return SimuladoRespondidoEstatisticaItem(
      data: DateTime.parse(json['data']),
      percentualAcertos: json['percentualAcertos'] as double,
    );
  }
}

class SimuladoRespondidoEstatisticaModuloItem {
  final String modulo;
  final double percentualAcertos;

  SimuladoRespondidoEstatisticaModuloItem({this.modulo, this.percentualAcertos});

  factory SimuladoRespondidoEstatisticaModuloItem.fromJson(Map<String, dynamic> json) {
    return SimuladoRespondidoEstatisticaModuloItem(
      modulo: json['modulo'],
      percentualAcertos: json['percentualAcertos'] as double,
    );
  }
}
