import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/components/circle_image.dart';
import 'package:formula_bancaria_app/components/footer.dart';
import 'package:formula_bancaria_app/components/header.dart';

class MudeVida extends StatelessWidget {
  static const routeName = '/alunos/mude-vida';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header().get(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(children: <Widget>[
                Column(children: <Widget>[
                  Container(
                    color: Colors.white,
                    height: 500,
                    child: Column(children: <Widget>[
                      SizedBox(height: 20.0),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Row(children: <Widget>[
                            CircleImage(
                                assetImage:
                                    'assets/images/logo/logo-branca.png',
                                height: 40.0),
                            Text("Mude de Vida",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22)),
                          ]),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      SizedBox(
                          height: 50.0,
                          width: 300.0,
                          child: RaisedButton.icon(
                            onPressed: () {
                              print('Button Clicked.');
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              side: BorderSide(color: Color(0xFF2A2F52)),
                            ),
                            label: Text(
                              'Fórmula comentada',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.yellowAccent[300]),
                            ),
                            icon: Image.asset(
                              'assets/images/logo/logo-colorida.png',
                              height: 30.0,
                            ),
                            color: Colors.white,
                          )),
                      SizedBox(height: 10.0),
                      Text('R\$14,90 / Mensal (Exceto CFP®)',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0xFF2A2F52))),
                      SizedBox(height: 20.0),
                      SizedBox(
                        height: 50.0,
                        width: 300.0,
                        child: RaisedButton.icon(
                            onPressed: () {
                              print('Button Clicked.');
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              side: BorderSide(color: Color(0xFF2A2F52)),
                            ),
                            label: Text(
                              'CFP® comentado',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.yellowAccent[700]),
                            ),
                            icon: Image.asset(
                              'assets/images/logo/logo-branca.png',
                              height: 40.0,
                            ),
                            splashColor: Colors.white,
                            color: Color(0xFF2A2F52)),
                      ),
                      SizedBox(height: 10.0),
                      Text('R\$44,90 / Mensal (CFP®)',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                            child: Row(
                          children: <Widget>[
                            IconButton(
                                icon: Icon(
                                  Icons.arrow_downward,
                                ),
                                iconSize: 30,
                                onPressed: null),
                            Text("Conheça e Mude de Vida",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color(0xFF2A2F52))),
                            IconButton(
                                icon: Icon(
                                  Icons.arrow_downward,
                                ),
                                iconSize: 30,
                                onPressed: null),
                          ],
                        )),
                      ),
                      SizedBox(
                          height: 50.0,
                          width: 300.0,
                          child: RaisedButton.icon(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/aluno/formula_expert');
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              side: BorderSide(color: Color(0xFF2A2F52)),
                            ),
                            label: Text(
                              'Fórmula Expert',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.yellowAccent[700]),
                            ),
                            icon: Image.asset(
                              'assets/images/logo/logo-branca.png',
                              height: 40.0,
                            ),
                            color: Color(0xFF2A2F52),
                          )),
                    ]),
                  ),
                ]),
              ])),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
