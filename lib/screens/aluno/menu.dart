import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/components/aluno/menu-item.widget.dart';
import 'package:formula_bancaria_app/components/cabecalho.dart';
import 'package:formula_bancaria_app/components/rodape.dart';

import '../../components/logo.dart';

class MenuAluno extends StatefulWidget {
  @override
  _MenuAlunoState createState() => _MenuAlunoState();
}

class _MenuAlunoState extends State<MenuAluno> {
//   final darkTheme = ThemeData(
//   primarySwatch: Colors.grey,
//   primaryColor: Colors.black,
//   brightness: Brightness.dark,
//   backgroundColor: const Color(0xFF212121),
//   accentColor: Colors.white,
//   accentIconTheme: IconThemeData(color: Colors.black),
//   dividerColor: Colors.black12,
// );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(children: <Widget>[
                Column(children: <Widget>[
                  Container(
                    color: Colors.blueAccent,
                    padding:
                        EdgeInsets.only(left: 15.0, top: 15.0, bottom: 15.0),
                    child: Row(children: <Widget>[
                      SizedBox(height: 5.0),
                      Logo(height: 60.0),
                      Padding(
                        padding: EdgeInsets.only(left: 100),
                        child: Container(
                          child: new IconButton(
                              icon: new Icon(
                                Icons.more_vert,
                                color: Colors.black,
                              ),
                              onPressed: null),
                        ),
                      ),
                      SizedBox(height: 5.0),
                    ]),
                  ),
                  Container(
                    color: Colors.blue,
                    height: 500,
                    child: Column(children: <Widget>[
                      Row(children: <Widget>[
                        MenuItem(
                            buttonText: "CPA-10",
                            icon: Icon(Icons.book, color: Colors.black),
                            width: 100,
                            height: 100),
                        MenuItem(
                            buttonText: "CPA-20",
                            icon: Icon(Icons.book, color: Colors.black),
                            width: 100,
                            height: 100),
                      ]),
                      Row(children: <Widget>[
                        MenuItem(
                            buttonText: "CEA",
                            icon: Icon(Icons.book, color: Colors.black),
                            width: 100,
                            height: 100),
                        MenuItem(
                            buttonText: "AAI",
                            icon: Icon(Icons.book, color: Colors.black),
                            width: 100,
                            height: 100),
                      ]),
                      Row(children: <Widget>[
                        MenuItem(
                            buttonText: "CFP",
                            icon: Icon(Icons.book, color: Colors.black),
                            width: 100,
                            height: 100),
                        MenuItem(
                            buttonText: "Estudar questões",
                            icon: Icon(Icons.book, color: Colors.black),
                            width: 100,
                            height: 100),
                      ]),
                    ]),
                  ),
                  Container(
                    color: Colors.lightBlue,
                    padding: EdgeInsets.all(5.0),
                    child: Row(children: <Widget>[
                      Container(
                          child: Image.asset(
                        'assets/icons/percent.png',
                        height: 60,
                      )),
                      SizedBox(
                        width: 5.0,
                      ),
                      Container(
                          child: Image.asset(
                        'assets/icons/user.png',
                        height: 60,
                      )),
                      SizedBox(
                        width: 5.0,
                      ),
                      Center(
                        child: CircleAvatar(
                          radius: 37,
                          backgroundColor: Colors.blue,
                          child: CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                  'assets/images/logo/logo-colorida.png'), // CircleAvatar(
                              //   radius: 30,
                              //   backgroundColor: Colors.white,
                              //   backgroundImage: AssetImage('assets/images/logo/logo-colorida.png'),
                              // ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Container(
                          child: Image.asset(
                        'assets/icons/cart.png',
                        height: 60,
                      )),
                      SizedBox(
                        width: 5.0,
                      ),
                      Container(
                          child: Image.asset(
                        'assets/icons/play.png',
                        height: 60,
                      )),
                    ]),
                  ),
                ]),
              ])),
        ),
      ),
    );
  }
}
