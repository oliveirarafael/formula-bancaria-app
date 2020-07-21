import 'package:flutter/material.dart';

class Rodape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Row(children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/aluno/estatisticas');
          },
          child: Container(child: Image.asset('assets/icons/percent.png', height: 60,)),
        ),
        SizedBox(width: 5.0,),
        Container(child: Image.asset('assets/icons/user.png', height: 60,)),
        SizedBox(width: 5.0,),
        Center(
          child: CircleAvatar(radius: 37, backgroundColor: Colors.blue, child: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Image.asset('assets/images/logo/logo-colorida.png'), // CircleAvatar(
            ),
          ),
          ),
        ),

        SizedBox(width: 5.0,),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/aluno/loja_virtual');
          },
          child: Container(child: Image.asset('assets/icons/cart.png', height: 60,)),
        ),
        SizedBox(width: 5.0,),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/aluno/dicas_fundador');
          },
          child: Container(child: Image.asset('assets/icons/play.png', height: 60,)),
        ),
      ]),
    );
  }
}