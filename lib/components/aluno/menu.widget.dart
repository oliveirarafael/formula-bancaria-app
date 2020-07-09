import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/components/aluno/menu-item-bottom.widget.dart';
import 'package:formula_bancaria_app/components/aluno/menu-item.widget.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(children: <Widget>[
        MenuItem(buttonText: "Simulado completo", icon: Icon(Icons.book), width: 150, height: 100),
        MenuItem(buttonText: "Estudar módulos", icon: Icon(Icons.assignment), width: 150, height: 100),
      ]),
      Row(children: <Widget>[
        MenuItem(buttonText: "Estatísticas", icon: Icon(Icons.book), width: 150, height: 100),
        MenuItem(buttonText: "Aula particular", icon: Icon(Icons.assignment), width: 150, height: 100),
      ]),
      Row(children: <Widget>[
        MenuItem(buttonText: "Nossos cursos", icon: Icon(Icons.book), width: 150, height: 100),
        MenuItem(buttonText: "Nosso canal", icon: Icon(Icons.assignment), width: 150, height: 100),
      ]),
      Row(children: <Widget>[
        MenuItemBottom(buttonText: "Acesso aos cursos", width: 150, height: 5),
        MenuItemBottom(buttonText: "Certificação", width: 150, height: 10),
      ]),
    ]);
  }
}