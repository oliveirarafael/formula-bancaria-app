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
        leading: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () => print("Sair"),
            ),
          ],
        ),
        title: Center(
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.book),
              onPressed: () =>
                  Navigator.pushNamed(context, AulasParticulares.routeName),
            ),
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () =>
                  Navigator.pushNamed(context, DicasFundador.routeName),
            ),
            IconButton(
              icon: Icon(Icons.bookmark),
              onPressed: () =>
                  Navigator.pushNamed(context, EbooksApostilas.routeName),
            ),
            IconButton(
              icon: Icon(Icons.folder),
              onPressed: () =>
                  Navigator.pushNamed(context, FormulaExpert.routeName),
            ),
            IconButton(
              icon: Icon(Icons.shop),
              onPressed: () =>
                  Navigator.pushNamed(context, LojaVirtual.routeName),
            ),
            IconButton(
              icon: Icon(Icons.link_off),
              onPressed: () => Navigator.pushNamed(context, MudeVida.routeName),
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
