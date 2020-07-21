import 'package:flutter/material.dart';

import 'logo.dart';

class Cabecalho extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 15.0),
      child: Row(children: <Widget>[
        SizedBox(height: 5.0),
        Logo(height: 60.0),
        Padding(
          padding: EdgeInsets.only(left: 100),
          child: Container(
            child: new IconButton(
                icon: new Icon(Icons.more_vert,color: Colors.white,), onPressed: null),
          ),
        ),
        SizedBox(height: 5.0),
      ]),
    );
  }
}