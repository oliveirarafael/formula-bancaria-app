import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/screens/aluno/aulas_particulares.dart';
import 'package:formula_bancaria_app/screens/aluno/dicas_fundador.dart';
import 'package:formula_bancaria_app/screens/aluno/ebooks_apostilas.dart';
import 'package:formula_bancaria_app/screens/aluno/formula_expert.dart';
import 'package:formula_bancaria_app/screens/aluno/loja_virtual.dart';
import 'package:formula_bancaria_app/screens/aluno/mude_vida.dart';
import 'package:formula_bancaria_app/screens/aluno/simulado/simulado_ativo.page.dart';

class Dashboard extends StatelessWidget {
  static const routeName = '/aluno/dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2A2F52),
        leading: Container(),
        title: Container(
          child: Image.asset(
            'assets/images/logo/logo-horizontal-branca.png',
            height: 40,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () => print("ok"))
        ],
      ),
      body: this._gridSimulados(context),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF2A2F52),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Image.asset("assets/icons/percent.png"),
              onPressed: () =>
                  Navigator.pushNamed(context, AulasParticulares.routeName),
            ),
            IconButton(
              icon: Image.asset("assets/icons/user.png"),
              onPressed: () =>
                  Navigator.pushNamed(context, DicasFundador.routeName),
            ),
            IconButton(
              icon: Image.asset("assets/icons/circulo-formula.png"),
            ),
            IconButton(
              icon: Image.asset("assets/icons/cart.png"),
              onPressed: () =>
                  Navigator.pushNamed(context, EbooksApostilas.routeName),
            ),
            IconButton(
              icon: Image.asset("assets/icons/play.png"),
              onPressed: () =>
                  Navigator.pushNamed(context, FormulaExpert.routeName),
            ),
          ],
        ),
      ),
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
