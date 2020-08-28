import 'dart:io';

import 'package:flutter/material.dart';

class AulasParticulares extends StatefulWidget {
  static const routeName = '/alunos/aulas-particulares';

  @override
  _AulasParticularesState createState() => _AulasParticularesState();
}

class _AulasParticularesState extends State<AulasParticulares> {
  var _simulados = ['Selecione', 'CPA 10', 'CPA 20', 'CEA', 'AAI', 'CFP'];
  var _itemSelecionado = 'Selecione';

  void _dropDownItemSelected(String novoItem) {
    setState(() {
      this._itemSelecionado = novoItem;
    });
  }

  Future<void> enviarWhatsAppAulasParticulares() async {
    launchWhatsApp(
        phone: "+5521996376154",
        message:
            "Olá, Fórmula Bancária.\n\nQuero saber mais sobre as aulas particulares para " +
                _itemSelecionado);
  }

  Future<void> enviarWhatsAppRevisaoPreProva() async {
    launchWhatsApp(
        phone: "+5521996376154",
        message:
            "Olá, Fórmula Bancária.\n\nQuero saber mais sobre a Pré-prova para " +
                _itemSelecionado);
  }

  void launchWhatsApp({
    @required String phone,
    @required String message,
  }) async {
    String url() {
      if (Platform.isIOS) {
        return "whatsapp://wa.me/$phone/?text=${Uri.parse(message)}";
      } else {
        return "whatsapp://send?phone=$phone&text=${Uri.parse(message)}";
      }
    }

    /*if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aulas Particulares"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(children: <Widget>[
                Column(children: <Widget>[
                  Container(
                    color: Colors.white,
                    height: 500,
                    child: Column(children: <Widget>[
                      SizedBox(height: 20.0),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Row(children: <Widget>[
                            Text("Aulas Particulares",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22)),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Row(children: <Widget>[
                            Column(children: <Widget>[
                              Text(
                                  "Selecione a certificação que você quer \nter aula:",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18)),
                              DropdownButton<String>(
                                  items: _simulados
                                      .map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(dropDownStringItem),
                                    );
                                  }).toList(),
                                  onChanged: (String novoItemSelecionado) {
                                    _dropDownItemSelected(novoItemSelecionado);
                                    setState(() {
                                      this._itemSelecionado =
                                          novoItemSelecionado;
                                    });
                                  },
                                  value: _itemSelecionado),
                            ]),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Column(children: <Widget>[
                            FlatButton.icon(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.green)),
                              color: Colors.green,
                              icon: Icon(Icons.ac_unit, color: Colors.white),
                              label: Text('Contratar',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0)),
                              padding: EdgeInsets.all(15.0),
                              onPressed: () =>
                                  {enviarWhatsAppAulasParticulares()},
                            ),
                          ]),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Row(children: <Widget>[
                            Text("Revisão Pré-prova",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22)),
                          ]),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Row(children: <Widget>[
                              Column(children: <Widget>[
                                Text(
                                    "Faça nossa incrível revisão pré-prova \ncom um de nossos professores que \nconhecem a fundo a certificação:",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18)),
                              ]),
                            ]),
                          )),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Column(children: <Widget>[
                            FlatButton.icon(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.green)),
                              color: Colors.green,
                              icon: Icon(Icons.ac_unit, color: Colors.white),
                              label: Text('Contratar',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0)),
                              padding: EdgeInsets.all(15.0),
                              onPressed: () =>
                                  {enviarWhatsAppRevisaoPreProva()},
                            ),
                          ]),
                        ),
                      ),
                    ]),
                  ),
                ]),
              ])),
        ),
      ),
    );
  }
}
