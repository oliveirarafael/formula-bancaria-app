import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  double height;
  String assetImage;

  CircleImage({
    @required this.height,
    @required this.assetImage
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image:AssetImage("assets/images/circulo-azul.png"), 
          fit:BoxFit.fitHeight
        ),
      ),
      child: FlatButton(
        shape: CircleBorder(side: BorderSide.none),
        onPressed: null,
        padding: EdgeInsets.all(height - 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(assetImage, height: height)
          ],
        ),
      )
    );
  }
}