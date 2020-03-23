import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/models/modulo.dart';
import 'package:formula_bancaria_app/models/simulado.dart';
import 'package:formula_bancaria_app/repository/simulado/simulado_repository.dart';

class ListaModulo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListaModuloState();
  }
}

class _ListaModuloState extends State<ListaModulo> {
  BuildContext _context;
  SimuladoRepository simuladoRepository = SimuladoRepository();
  Simulado _simulado;

  @override
  Widget build(BuildContext context) {
    this._context = context;
    _simulado = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('${this._simulado.titulo} - Modulos'),
      ),
      body: FutureBuilder(
        future: simuladoRepository.modulos(this._simulado.uuid),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasData) {
                return _modulosList(snapshot.data);
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

  Widget _modulosList(Simulado simulado) {
    List<Modulo> modulos = simulado.modulos;

    return ListView.builder(
      itemCount: modulos.length,
      itemBuilder: (context, posicao) {
        return _ItemModulo(modulos[posicao]);
      },
    );
  }

  Function _formulario() {
    Navigator.pushNamed(
      this._context,
      '/novo-modulo',
      arguments: this._simulado,
    );
  }
}

class _ItemModulo extends StatelessWidget {
  final Modulo _modulo;

  _ItemModulo(this._modulo);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.archive),
        title: Text(this._modulo.titulo),
      ),
    );
  }
}
