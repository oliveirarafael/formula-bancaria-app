class Simulado {
  final String titulo;
  final String descricao;

  Simulado(this.titulo, this.descricao);

  @override
  String toString() {
    return '{ titulo: $titulo, descricao: $descricao }';
  }
}