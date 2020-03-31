import 'package:flutter/material.dart';

class ButtonFB extends StatelessWidget {
  
  final Function onPressed;
  final String text;

  ButtonFB({@required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(this.text),
      onPressed: onPressed,
    );
  }

}
