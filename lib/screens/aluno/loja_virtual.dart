import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/components/circle_image_link.dart';
import 'package:formula_bancaria_app/components/footer.dart';
import 'package:formula_bancaria_app/components/header.dart';
import 'package:formula_bancaria_app/screens/aluno/cursos_online.dart';
import 'package:formula_bancaria_app/screens/aluno/cursos_presenciais.dart';
import 'package:formula_bancaria_app/screens/aluno/ebooks_apostilas.dart';
import 'package:formula_bancaria_app/screens/aluno/mude_vida.dart';
import 'package:formula_bancaria_app/screens/dashboard/dashboard.dart';
// import 'package:formula_bancaria_app/components/circle_image.dart';

class LojaVirtual extends StatelessWidget {
  static const routeName = '/alunos/loja';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header().get(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.popAndPushNamed(context, Dashboard.routeName),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.0),
            child: Column(
              children: <Widget>[
                Center(
                    child: Container(
                  child: Column(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Center(
                        child: Text(
                          "Loja Virtual",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(children: <Widget>[
                        SizedBox(width: 10.0),
                        Center(
                          child: Column(children: <Widget>[
                            CircleImageLink(
                                assetImage: "assets/images/pessoa.png",
                                height: 55.0,
                                link: CursosPresenciais.routeName),
                            Text(
                              "Cursos\nPresenciais",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ]),
                        ),
                        SizedBox(width: 40.0),
                        Center(
                          child: Column(children: <Widget>[
                            CircleImageLink(
                                assetImage: "assets/images/capelo.png",
                                height: 55.0,
                                link: CursosOnline.routeName),
                            Text(
                              "Cursos\nOnline",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ]),
                        ),
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(children: <Widget>[
                        SizedBox(width: 10.0),
                        Center(
                          child: Column(children: <Widget>[
                            CircleImageLink(
                                assetImage: "assets/images/ebook.png",
                                height: 55.0,
                                link: EbooksApostilas.routeName),
                            Text(
                              "E-book &\n Apostilas",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ]),
                        ),
                        SizedBox(width: 40.0),
                        Center(
                          child: Column(children: <Widget>[
                            CircleImageLink(
                                assetImage:
                                    "assets/images/logo/logo-branca.png",
                                height: 55.0,
                                link: MudeVida.routeName),
                            Text(
                              "Mude de\nVida",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ]),
                        ),
                      ]),
                    ),
                  ]),
                )),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
