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
          onTap: () =>
              Navigator.pushNamed(context, SimuladoAtivoPage.routeName),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.book,
                  size: 50,
                  color: Colors.white,
                ),
                Text(
                  "CPA 10",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            color: Colors.blue[100],
          ),
        ),
        GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, "/aluno/simulado/simulado-ativo"),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.book,
                  size: 50,
                  color: Colors.white,
                ),
                Text(
                  "CPA 20",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            color: Colors.blue[200],
          ),
        ),
        GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, "/aluno/simulado/simulado-ativo"),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.book,
                  size: 50,
                  color: Colors.white,
                ),
                Text(
                  "CEA",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            color: Colors.blue[300],
          ),
        ),
        GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, "/aluno/simulado/simulado-ativo"),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.book,
                  size: 50,
                  color: Colors.white,
                ),
                Text(
                  "CFP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            color: Colors.blue[400],
          ),
        ),
      ],
    );
  }
}
