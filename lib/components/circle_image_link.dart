import 'package:flutter/material.dart';

class CircleImageLink extends StatelessWidget {
  String assetImage;
  double height;
  String link;

  CircleImageLink(
      {@required this.assetImage, @required this.height, @required this.link});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/circulo-azul.png"),
              fit: BoxFit.fitHeight),
        ),
        child: FlatButton(
          shape: CircleBorder(side: BorderSide.none),
          onPressed: () => {Navigator.pushNamed(context, link)},
          padding: EdgeInsets.all(height - 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Image.asset(assetImage, height: height)],
          ),
        ));
  }
}
