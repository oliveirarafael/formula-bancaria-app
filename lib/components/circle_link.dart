import 'package:flutter/material.dart';

class CircleLink extends StatelessWidget {
  String buttonText;
  double height;
  String link;

  CircleLink({
    @required this.buttonText,
    @required this.height,
    @required this.link
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image:AssetImage("assets/images/circulo-azul.png"), 
          fit:BoxFit.fitHeight
        ),
      ),
      child: FlatButton(
        shape: CircleBorder(side: BorderSide.none),
        onPressed: () => { Navigator.pushNamed(context, link) },
        padding: EdgeInsets.all(height),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // icon,
            Text(buttonText, style: TextStyle(color: Colors.white, fontSize: 16.0),)
          ],
        ),
      )
    );
  }
}