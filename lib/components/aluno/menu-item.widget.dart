import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  BuildContext _context;
  var buttonText = "";
  var icon = Icon(Icons.book);
  double width;
  double height;

  MenuItem({
    @required this.buttonText,
    @required this.icon,
    @required this.width,
    @required this.height,
  });

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Container(
      margin: EdgeInsets.only(left: 18, top: 15, bottom: 5),
      width: 150,
      height: 100,
      child: FlatButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        color: Theme.of(context).scaffoldBackgroundColor,
        //color: Colors.blue,
        onPressed: () => {
          Navigator.pushNamed(this._context, '/aluno/simulado/simulado-ativo')
        },
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon,
            Text(
              buttonText,
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
