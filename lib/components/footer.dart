import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/screens/aluno/aulas_particulares.dart';
import 'package:formula_bancaria_app/screens/aluno/dicas_fundador.dart';
import 'package:formula_bancaria_app/screens/aluno/formula_expert.dart';
import 'package:formula_bancaria_app/screens/aluno/loja_virtual.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
                Navigator.pushNamed(context, FormulaExpert.routeName),
          ),
          IconButton(
            icon: Image.asset("assets/icons/circulo-formula.png"),
          ),
          IconButton(
            icon: Image.asset("assets/icons/cart.png"),
            onPressed: () =>
                Navigator.pushNamed(context, LojaVirtual.routeName),
          ),
          IconButton(
            icon: Image.asset("assets/icons/play.png"),
            onPressed: () =>
                Navigator.pushNamed(context, DicasFundador.routeName),
          ),
        ],
      ),
    );
  }
}
