import 'package:flutter/material.dart';
import 'package:formula_bancaria_app/components/cabecalho.dart';
import 'package:formula_bancaria_app/components/rodape.dart';

class DicasFundador extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(children: <Widget>[
            Column(children: <Widget>[
              Cabecalho(),
              Container(
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.all(0.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage("assets/images/fundador.png"),
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomRight,
                    repeat: ImageRepeat.noRepeat
                  )
                ),
                // color: Colors.white,
                height: 500,
                child: 
                Column(children: <Widget>[
                  // Image.asset('assets/images/fundador.png', fit: BoxFit.cover, alignment: new Alignment(-2.0, -1.0),),
                  Padding(padding: EdgeInsets.all(20.0), child: 
                    Center(child: 
                      Row(children: <Widget>[
                        Text("Dicas & Lives com o Fundador", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22)),
                      ]),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(20.0), child:
                    Column(children: <Widget>[
                      Align(child: Text("Siga o prof. Gabriel Redivo, CFP®,", style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 18)), alignment: Alignment.centerLeft),
                      Align(child: Text("Fundador da Fórmula Bancária, ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 18)), alignment: Alignment.centerLeft),
                      Align(child: Text("expert em certificações para o ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 18)), alignment: Alignment.centerLeft),
                      Align(child: Text("Mercado Financeiro e ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 18)), alignment: Alignment.centerLeft),
                      Align(child: Text("tenha acesso a ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 18)), alignment: Alignment.centerLeft),
                      Align(child: Text("lives, dicas e ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 18)), alignment: Alignment.centerLeft),
                      Align(child: Text("post's diários em ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 18)), alignment: Alignment.centerLeft),
                      Align(child: Text("seu Instagram ou ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 18)), alignment: Alignment.centerLeft),
                      Align(child: Text("Canal no Youtube", style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 18)), alignment: Alignment.centerLeft)
                    ]),
                  ),
                  Align(alignment: Alignment.topRight,
                  child: Visibility(
                    child: Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: ImageIcon(
                          AssetImage("assets/images/fundador.png"),
                          size: 10,
                          color: Colors.white,
                        )),
                  ),),
                  SizedBox(height: 70.0),
                  Padding(padding: EdgeInsets.all(20.0), child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      verticalDirection: VerticalDirection.down,
                      children: <Widget>[
                      FlatButton.icon(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Theme.of(context).scaffoldBackgroundColor)
                        ),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        icon: Icon(Icons.camera, color: Colors.white),
                        label: Text('Seguir!', style: TextStyle(color: Colors.white, fontSize: 20.0)),
                        padding: EdgeInsets.all(15.0),
                        onPressed: () {
                        },
                      ),
                      SizedBox(width: 20.0),
                      FlatButton.icon(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.red)
                        ),
                        color: Colors.red,
                        icon: Icon(Icons.camera, color: Colors.white),
                        label: Text('Inscrever', style: TextStyle(color: Colors.white, fontSize: 20.0)),
                        padding: EdgeInsets.all(15.0),
                        onPressed: () {
                        },
                      ),
                      // Image(image: new AssetImage('assets/images/fundador.png')),
                    ])
                  ),
                ]),
              ),
              Rodape(),
            ]),
          ])
        ),
        ),
      ),
    );
  }
}