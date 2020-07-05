import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  String textButton = '';
  double height = 60.0;
  Function function = () {};

 GradientButton({
    @required this.textButton,
    @required this.height,
    @required this.function
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: RaisedButton(
        onPressed: function,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 300.0, minHeight: 60.0),
            alignment: Alignment.center,
            child: Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
              ),
            ),
          ),
        ),
      ),
    );
  }
}