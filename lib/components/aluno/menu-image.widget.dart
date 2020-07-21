import 'package:flutter/material.dart';
import 'menu-item-image.widget.dart';

class MenuImagem extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(children: <Widget>[
        MenuItemImage(imageUrl: "assets/images/certificacao/cpa10.png", buttonText: "CPA-10", icon: Icon(Icons.book), width: 140, height: 100),
        MenuItemImage(imageUrl: "assets/images/certificacao/cpa20.png", buttonText: "CPA-20", icon: Icon(Icons.book), width: 145, height: 105),
      ]),
      Row(children: <Widget>[
        MenuItemImage(imageUrl: "assets/images/certificacao/cea.png", buttonText: "CEA", icon: Icon(Icons.book),  width: 145, height: 100),
        MenuItemImage(imageUrl: "assets/images/certificacao/cfp.png", buttonText: "CFP", icon: Icon(Icons.book), width: 145, height: 100),
      ]),
      Row(children: <Widget>[
        MenuItemImage(imageUrl: "assets/images/certificacao/aai.png", buttonText: "AAI", icon: Icon(Icons.book), width: 145, height: 100),
        // MenuItem(buttonText: "Nosso canal", icon: Icon(Icons.assignment), width: 150, height: 100),
      ]),
      Row(children: <Widget>[
        
        // MenuItemBottom(buttonText: "Acesso aos cursos", width: 150, height: 5),
        // MenuItemBottom(buttonText: "Certificação", width: 150, height: 10),
      ]),
    ]);
  }
}