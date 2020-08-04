import 'package:flutter/material.dart';

class FormulaExpert extends StatelessWidget {
  static const routeName = '/alunos/formula-expert';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.0),
              child: Column(children: <Widget>[
                Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(0.0),
                    padding: EdgeInsets.all(0.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      image: DecorationImage(
                          image: AssetImage("assets/images/fundador.png"),
                          fit: BoxFit.cover,
                          alignment: Alignment.bottomRight,
                          repeat: ImageRepeat.noRepeat),
                    ),
                    // color: Colors.white,
                    height: 500,
                    child: Column(children: <Widget>[
                      // Image.asset('assets/images/fundador.png', fit: BoxFit.cover, alignment: new Alignment(-2.0, -1.0),),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child:
                              // Row(children: <Widget>[
                              Text("Fórmula Expert",
                                  style: TextStyle(
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24)),
                          // ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(children: <Widget>[
                          Align(
                              child: Text(
                                  "Torne-se um Expert em Investimentos e\n" +
                                      "Atendimento ao cliente através da\n" +
                                      "assinatura mensal do Fórmula Expert.\n",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                      height: 1.2)),
                              alignment: Alignment.centerLeft),
                          Align(
                              child: Text(
                                  "•Receba diariamente \nnotícias exclusivas sobre \no mercado.",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16)),
                              alignment: Alignment.centerLeft),
                          SizedBox(height: 7.0),
                          Align(
                              child: Text(
                                  "•Acesse a +200 vídeos de \npráticas do dia a dia.",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16)),
                              alignment: Alignment.centerLeft),
                          SizedBox(height: 7.0),
                          Align(
                              child: Text("•Insight de Investimentos",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16)),
                              alignment: Alignment.centerLeft),
                          SizedBox(height: 7.0),
                          Align(
                              child: Text(
                                  "•E-books e ferramentas \npara facilitar seu dia a dia",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16)),
                              alignment: Alignment.centerLeft),
                          SizedBox(height: 7.0),
                          Align(
                              child: Text(
                                  "•Suporte na compreensão \ndo mercado de ações e nas \nopções de investimentos \ne muito mais",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16)),
                              alignment: Alignment.centerLeft),
                        ]),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              verticalDirection: VerticalDirection.down,
                              children: <Widget>[
                                FlatButton.icon(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor)),
                                  color: Colors.yellow,
                                  icon: Icon(Icons.camera,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor),
                                  label: Text('Contratar',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          fontSize: 20.0)),
                                  padding: EdgeInsets.all(15.0),
                                  onPressed: () {},
                                ),
                              ])),
                    ]),
                  ),
                ]),
              ])),
        ),
      ),
    );
  }
}
