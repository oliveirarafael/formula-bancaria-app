import 'package:formula_bancaria_app/models/simulado_descricao.dart';
import 'package:formula_bancaria_app/models/simulado_descricao_colecao.dart';
import 'package:formula_bancaria_app/models/simulado_respondido_estatistica.dart';
import 'package:formula_bancaria_app/models/usuario_logado.dart';
import 'package:formula_bancaria_app/services/simulado_respondido_service.dart';
import 'package:formula_bancaria_app/services/usuario_service.dart';

class EstatisticaController {
  SimuladoRespondidoEstatistica _estatisticas = null;
  List<SimuladoDescricao> _simulados = null;

  Future<void> initialize() async {
    int simuladoId = 1;
    _estatisticas = await getEstatisticasPorSimuladoAsync(simuladoId);
    int usuarioId = UsuarioLogado.getUser().id;
    _simulados = await getSimuladosUsuariosAsync(usuarioId);

    if(_estatisticas != null)
    {
      print('Número de questões: ${_estatisticas.estatisticasPorSimulados.length}');
    }
    else {
      print('Nenhuma estatísticas cadastrada');
    }
  }

  // Future<void> reinitialize(int _idSimulado) async {
  //   _estatisticas = await getEstatisticasPorSimuladoAsync(_idSimulado);

  //   if(_estatisticas != null)
  //   {
  //     print('Número de estatísticas: ${_estatisticas.estatisticasPorSimulados.length}');
  //   }
  //   else {
  //     print('Nenhuma estatísticas cadastrada');
  //   }
    
  // }

   Future<SimuladoRespondidoEstatistica> getEstatisticasPorSimuladoAsync(int id) async {
    _estatisticas = await SimuladoRespondidoService().getEstatisticas(id);
    return _estatisticas;
  }

  SimuladoRespondidoEstatistica getEstatisticas() {
    return _estatisticas;
  }

  Future<List<SimuladoDescricao>> getSimuladosUsuariosAsync(int idUsuario) async {
    SimuladoDescricaoColecao result = await UsuarioService().getSimuladosUsuario(idUsuario);
    _simulados = result.simulados;
    return _simulados;
  }

  List<SimuladoDescricao> getSimulados() {
    return _simulados;
  }


  // SimuladoRespondidoEstatistica getEstatisticasPorSimulado(int id) {
  //   SimuladoRespondidoEstatistica simulado = null;
  //   SimuladoRespondidoService().getEstatisticas(id).then((response) => {
  //     simulado = response
  //   });

  //   return simulado;
  // }
}