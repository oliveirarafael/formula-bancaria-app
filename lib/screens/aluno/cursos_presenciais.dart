import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/components/circle_image.dart';
import 'package:formula_bancaria_app/components/footer.dart';
import 'package:formula_bancaria_app/components/header.dart';
import 'package:formula_bancaria_app/screens/aluno/loja_virtual.dart';

class CursosPresenciais extends StatefulWidget {
  static const routeName = '/alunos/cursos-presenciais';

  @override
  _CursosPresenciaisState createState() => _CursosPresenciaisState();
}

class _CursosPresenciaisState extends State<CursosPresenciais> {
  List<String> _cursos = ['Selecione', 'CPA 10', 'CPA 20', 'CEA', 'AAI', 'CFP'];
  String _cursoSelecionado = '';

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
        padding: EdgeInsets.all(10),
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: CircleImage(
                  assetImage: 'assets/images/pessoa.png',
                  height: 45.0,
                ),
              ),
              Text(
                "Cursos Presenciais",
                style: TextStyle(
                  color: Color(0xFF2A2F52),
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "Qual curso você deseja?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "Selecione o Curso que deseja ter aula presencialmente: ",
              style: TextStyle(
                color: Color(0xFF2A2F52),
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
          DropdownButton<String>(
            items: _cursos.map((String dropDownStringItem) {
              return DropdownMenuItem<String>(
                value: dropDownStringItem,
                child: Text(dropDownStringItem),
              );
            }).toList(),
            onChanged: (String novoItemSelecionado) {
              _dropDownItemSelected(novoItemSelecionado);
              setState(() {
                this._cursoSelecionado = novoItemSelecionado;
              });
            },
            value: _cursoSelecionado,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "Em qual Estado deseja?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "Selecione o Estado e a Cidade que deseja ter o curso presencial: ",
              style: TextStyle(
                color: Color(0xFF2A2F52),
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(70),
            child: FlatButton.icon(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(
                  color: Colors.green,
                ),
              ),
              color: Colors.green,
              icon: Icon(Icons.camera, color: Colors.white),
              label: Text(
                'Contratar',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              padding: EdgeInsets.all(10.0),
              onPressed: () {},
            ),
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }

  void _dropDownItemSelected(String novoItem) {
    setState(() {
      this._cursoSelecionado = novoItem;
    });
  }
}
