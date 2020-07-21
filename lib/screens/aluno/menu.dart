import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/components/aluno/menu-item.widget.dart';
import 'package:formula_bancaria_app/components/cabecalho.dart';
import 'package:formula_bancaria_app/components/rodape.dart';

class MenuAluno extends StatefulWidget {
  @override
  _MenuAlunoState createState() => _MenuAlunoState();
}

class _MenuAlunoState extends State<MenuAluno> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(children: <Widget>[
            Column(children: <Widget>[
              Cabecalho(),
              Container(
                color: Colors.white,
                height: 500,
                child: 
                Column(children: <Widget>[
                  Row(children: <Widget>[
                     MenuItem(buttonText: "CPA 10", icon: Icon(Icons.book, color: Colors.white), width: 100, height: 100),
                     MenuItem(buttonText: "CPA 20", icon: Icon(Icons.book, color: Colors.white), width: 100, height: 100),
                  ]),
                  Row(children: <Widget>[
                     MenuItem(buttonText: "CEA", icon: Icon(Icons.book, color: Colors.white), width: 100, height: 100),
                     MenuItem(buttonText: "AAI", icon: Icon(Icons.book, color: Colors.white), width: 100, height: 100),
                  ]),
                  Row(children: <Widget>[
                     MenuItem(buttonText: "CFP", icon: Icon(Icons.book, color: Colors.white), width: 100, height: 100),
                     MenuItem(buttonText: "Estudar questões", icon: Icon(Icons.book, color: Colors.white), width: 100, height: 100),
                  ]),
                ]),
              ),
              Rodape(),
            ]),
          ])
        ),
        ),
      ),
    );
  }
}