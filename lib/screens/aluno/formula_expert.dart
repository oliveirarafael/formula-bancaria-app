import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/components/footer.dart';
import 'package:formula_bancaria_app/components/header.dart';

class FormulaExpert extends StatelessWidget {
  static const routeName = '/alunos/formula-expert';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: Header().get(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xFF2A2F52),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.0),
              child: Column(
                children: <Widget>[
                  Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(0.0),
                      padding: EdgeInsets.all(0.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/fundador.png"),
                            fit: BoxFit.cover,
                            alignment: Alignment.bottomRight,
                            repeat: ImageRepeat.noRepeat),
                      ),
                      // color: Colors.white,
                      height: 560,
                      child: Column(children: <Widget>[
                        // Image.asset('assets/images/fundador.png', fit: BoxFit.cover, alignment: new Alignment(-2.0, -1.0),),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child:
                                // Row(children: <Widget>[
                                Text("Fórmula Expert",
                                    style: TextStyle(
                                        color: Colors.yellowAccent[700],
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
                                    "• Receba diariamente \nnotícias exclusivas sobre \no mercado.",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16)),
                                alignment: Alignment.centerLeft),
                            SizedBox(height: 7.0),
                            Align(
                                child: Text(
                                    "• Acesse a +200 vídeos de \npráticas do dia a dia.",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16)),
                                alignment: Alignment.centerLeft),
                            SizedBox(height: 7.0),
                            Align(
                                child: Text("• Insight de Investimentos",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16)),
                                alignment: Alignment.centerLeft),
                            SizedBox(height: 7.0),
                            Align(
                                child: Text(
                                    "• E-books e ferramentas \npara facilitar seu dia a dia",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16)),
                                alignment: Alignment.centerLeft),
                            SizedBox(height: 7.0),
                            Align(
                                child: Text(
                                    "• Suporte na compreensão \ndo mercado de ações e nas \nopções de investimentos \ne muito mais",
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
                            //mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            verticalDirection: VerticalDirection.down,
                            children: <Widget>[
                              FlatButton.icon(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(
                                        color: Colors.yellowAccent[700])),
                                color: Colors.yellowAccent[700],
                                icon: Icon(Icons.camera,
                                    color: Color(0xFF2A2F52)),
                                label: Text('Contratar',
                                    style: TextStyle(
                                        color: Color(0xFF2A2F52),
                                        fontSize: 20.0)),
                                padding: EdgeInsets.all(10.0),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
