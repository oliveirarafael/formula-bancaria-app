import 'package:flutter/material.dart';

class MenuItemBottom extends StatelessWidget {

  var buttonText = "";
  double width;
  double height;

  MenuItemBottom({
    @required this.buttonText,
    @required this.width,
    @required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(left: 18, top: 15, bottom: 5),
      width: 150,
      height: 50,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        color: Theme.of(context).primaryColor,
        onPressed: () => {},
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Text(buttonText, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}