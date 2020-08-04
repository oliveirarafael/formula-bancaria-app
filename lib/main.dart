import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/screens/aluno/aulas_particulares.dart';
import 'package:formula_bancaria_app/screens/aluno/dicas_fundador.dart';
import 'package:formula_bancaria_app/screens/aluno/ebooks_apostilas.dart';
import 'package:formula_bancaria_app/screens/aluno/formula_expert.dart';
import 'package:formula_bancaria_app/screens/aluno/loja_virtual.dart';
import 'package:formula_bancaria_app/screens/aluno/menu.dart';
import 'package:formula_bancaria_app/screens/aluno/mude_vida.dart';
import 'package:formula_bancaria_app/screens/aluno/simulado/simulado_ativo.page.dart';
import 'package:formula_bancaria_app/screens/aluno/simulado/simulado_concluido.dart';
import 'package:formula_bancaria_app/screens/modulo/formulario.dart';
import 'package:formula_bancaria_app/screens/modulo/lista.dart';
import 'package:formula_bancaria_app/screens/questao/formulario.dart';
import 'package:formula_bancaria_app/screens/questao/lista.dart';
import 'package:formula_bancaria_app/screens/simulado/formulario.dart';
import 'package:formula_bancaria_app/screens/simulado/lista.dart';
import 'package:formula_bancaria_app/screens/usuario/cadastro_sucesso.dart';
import 'package:formula_bancaria_app/screens/usuario/cadastro_usuario.dart';
import 'package:formula_bancaria_app/screens/usuario/esqueceu_senha.dart';
import 'package:formula_bancaria_app/screens/usuario/login.dart';

import 'screens/dashboard/dashboard.dart';

void main() => runApp(FormulaBancariaAPP());

class FormulaBancariaAPP extends StatelessWidget {
  final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
  );

  final basicTheme = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: Colors.amber,
    scaffoldBackgroundColor: const Color(0xFF2A2F52),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
    textTheme: TextTheme(
      title: TextStyle(
          fontSize: 72.0, color: Colors.white, fontWeight: FontWeight.bold),
      body1: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      body2: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      caption: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      display1: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      display2: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      display3: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      display4: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      headline: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      button: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ).apply(
      bodyColor: Colors.pink,
      displayColor: Colors.pink,
    ),
    iconTheme: IconThemeData(color: Colors.white),
    primaryIconTheme: IconThemeData(color: Colors.green),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        hoverColor: Colors.green,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1),
          borderRadius: BorderRadius.circular(8.0),
        )),
    accentTextTheme: TextTheme(
      title: TextStyle(
          fontSize: 72.0, color: Colors.white, fontWeight: FontWeight.bold),
      body1: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      body2: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      caption: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      display1: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      display2: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      display3: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      display4: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      headline: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      button: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ).apply(
      bodyColor: Colors.pink,
      displayColor: Colors.pink,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => FormularioLogin(),
          SimuladoAtivoPage.routeName: (context) => SimuladoAtivoPage(),
          SimuladoConcluido.routeName: (context) => SimuladoConcluido(),
          Dashboard.routeName: (context) => Dashboard(),
          EsqueceuSenha.routeName: (context) => EsqueceuSenha(),
          CadastroUsuario.routeName: (context) => CadastroUsuario(),
          CadastroSucesso.routeName: (context) => CadastroSucesso(),
          AulasParticulares.routeName: (context) => AulasParticulares(),
          DicasFundador.routeName: (context) => DicasFundador(),
          EbooksApostilas.routeName: (context) => EbooksApostilas(),
          FormulaExpert.routeName: (context) => FormulaExpert(),
          LojaVirtual.routeName: (context) => LojaVirtual(),
          MudeVida.routeName: (context) => MudeVida(),
        },
        //theme: basicTheme,
        debugShowCheckedModeBanner: false);
  }
}
