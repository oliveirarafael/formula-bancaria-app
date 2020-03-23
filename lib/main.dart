import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/screens/modulo/formulario.dart';
import 'package:formula_bancaria_app/screens/modulo/lista.dart';
import 'package:formula_bancaria_app/screens/questao/formulario.dart';
import 'package:formula_bancaria_app/screens/questao/lista.dart';
import 'package:formula_bancaria_app/screens/simulado/formulario.dart';
import 'package:formula_bancaria_app/screens/simulado/lista.dart';
import 'package:formula_bancaria_app/screens/usuario/formulario_login.dart';

void main() => runApp(FormulaBancariaAPP());

class FormulaBancariaAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => FormularioLogin(),
        '/simulados': (context) => ListaSimulados(),
        '/simulado/modulos': (context) => ListaModulo(),
        '/simulado/modulos/questoes': (context) => ListaQuestao(),
        '/novo-simulado': (context) => FormularioSimulado(),
        '/novo-modulo': (context) => FormularioModulo(),
        '/novo-questao': (context) => FormularioQuestao(),
      },
      theme: ThemeData(
        primaryColor: Color(0xFF4b6798),
        accentColor: Color(0xFF4b6798),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFF4b6798),
          textTheme: ButtonTextTheme.primary,
        ),
      ),
    );
  }

}
