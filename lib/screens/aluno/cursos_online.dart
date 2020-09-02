import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/components/circle_image.dart';
import 'package:formula_bancaria_app/components/circle_link.dart';
import 'package:formula_bancaria_app/components/footer.dart';
import 'package:formula_bancaria_app/components/header.dart';
import 'package:formula_bancaria_app/screens/aluno/loja_virtual.dart';

class CursosOnline extends StatelessWidget {
  static const routeName = '/alunos/cursos-online';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header().get(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.popAndPushNamed(context, LojaVirtual.routeName),
        ),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: CircleImage(
                  assetImage: 'assets/images/capelo.png',
                  height: 45.0,
                ),
              ),
              Text(
                "Cursos Online",
                style: TextStyle(
                  color: Color(0xFF2A2F52),
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              CircleLink(
                buttonText: "CPA 10",
                height: 35.0,
                link: "",
              ),
              CircleLink(
                buttonText: "CPA 20",
                height: 35.0,
                link: "",
              ),
              CircleLink(
                buttonText: "CEA",
                height: 35.0,
                link: "",
              ),
            ],
          ),
          Row(
            children: <Widget>[
              CircleLink(
                buttonText: "AAI",
                height: 35.0,
                link: "",
              ),
              CircleLink(
                buttonText: "PQO",
                height: 35.0,
                link: "",
              ),
              CircleLink(
                buttonText: "CFP®",
                height: 35.0,
                link: "",
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
