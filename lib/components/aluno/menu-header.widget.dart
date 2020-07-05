import 'package:flutter/material.dart';

class MenuHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
      padding: EdgeInsets.only(left: 20, top: 10, right: 30, bottom: 30),
      child:  FittedBox(
        child: Row(children: <Widget>[
          Image.asset('assets/images/logo-horizontal-colorida-300x103.png', width: 200, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.only(left: 100),
            child: IconButton(icon: Icon(Icons.settings), iconSize: 30, onPressed: null),
          ),
        ]),
      ),
    ),
    Padding(padding: EdgeInsets.only(left: 20, top: 10, right: 30, bottom: 5),
      child: Row(children: <Widget>[
          Text("Olá, {{cliente.Nome}}. Vamos rumo à aprovação!", style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ))
        ]) 
    ),
    ]);
  }
}