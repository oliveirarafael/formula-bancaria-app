import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/models/modulo.dart';
import 'package:formula_bancaria_app/models/questao.dart';
import 'package:formula_bancaria_app/models/simulado.dart';
import 'package:formula_bancaria_app/repository/modulo/modulo_repository.dart';
import 'package:formula_bancaria_app/repository/simulado/simulado_repository.dart';

class ListaQuestao extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListaQuestaoState();
  }
}

class _ListaQuestaoState extends State<ListaQuestao> {
  BuildContext _context;
  ModuloRepository moduloRepository = ModuloRepository();
  Modulo _modulo;

  @override
  Widget build(BuildContext context) {
    this._context = context;
    this._modulo = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('${this._modulo.titulo} - Questões'),
      ),
      body: FutureBuilder(
        future: moduloRepository.modulos(this._modulo.uuid),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasData) {
                return _questoesList(snapshot.data);
              }
              return Center(
                child: Text('Não tem dados...'),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text('Ocorreu um erro...'),
                );
              }
              return Center(
                child: Text('Não tem dados...'),
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _formulario(),
      ),
    );
  }

  Widget _questoesList(Modulo modulo) {
    List<Questao> modulos = modulo.questoes;

    return ListView.builder(
      itemCount: modulos.length,
      itemBuilder: (context, posicao) {
        return _ItemQuestao(modulos[posicao]);
      },
    );
  }

  Function _formulario() {
    Navigator.pushNamed(
      this._context,
      '/novo-questao',
      arguments: this._modulo,
    );
  }
}

class _ItemQuestao extends StatelessWidget {
  final Questao _questao;

  _ItemQuestao(this._questao);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.archive),
        title: Text(this._questao.descricao),
      ),
    );
  }
}
