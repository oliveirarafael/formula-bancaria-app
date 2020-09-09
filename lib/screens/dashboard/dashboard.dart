import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/components/footer.dart';
import 'package:formula_bancaria_app/components/header.dart';
import 'package:formula_bancaria_app/screens/aluno/simulado/simulado_ativo.page.dart';

class Dashboard extends StatelessWidget {
  static const routeName = '/aluno/dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header().get(),
      body: this._gridSimulados(context),
      bottomNavigationBar: Footer(),
    );
  }

  Widget _gridSimulados(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SimuladoAtivoPage(simuladoId: 1),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Image.asset("assets/icons/cpa-10.png"),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SimuladoAtivoPage(simuladoId: 2),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Image.asset("assets/icons/cpa-20.png"),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SimuladoAtivoPage(simuladoId: 3),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Image.asset("assets/icons/cea.png"),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SimuladoAtivoPage(simuladoId: 4),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Image.asset("assets/icons/aai.png"),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SimuladoAtivoPage(simuladoId: 5),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Image.asset("assets/icons/cfp.png"),
          ),
        ),
        GestureDetector(
          onTap: () => print("Estudar questões"),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Image.asset("assets/icons/estudar-questoes.png"),
          ),
        ),
      ],
    );
  }
}
