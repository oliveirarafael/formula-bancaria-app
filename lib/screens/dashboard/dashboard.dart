import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    this._context = context;
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
      body: this._gridSimulados(),
      bottomNavigationBar: BottomAppBar(),
    );
  }

  Widget _gridSimulados() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        GestureDetector(
          onTap: () => Navigator.pushNamed(
              this._context, "/aluno/simulado/simulado-ativo"),
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
          onTap: () => Navigator.pushNamed(
              this._context, "/aluno/simulado/simulado-ativo"),
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
          onTap: () => Navigator.pushNamed(
              this._context, "/aluno/simulado/simulado-ativo"),
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
          onTap: () => Navigator.pushNamed(
              this._context, "/aluno/simulado/simulado-ativo"),
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
