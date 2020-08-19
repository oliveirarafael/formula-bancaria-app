import 'package:flutter/material.dart';

// TODO estudar melhor abordagem para criar Header
class Header {
  AppBar get() {
    return AppBar(
      backgroundColor: Color(0xFF2A2F52),
      leading: Container(),
      title: Container(
        child: Image.asset(
          'assets/images/logo/logo-horizontal-branca.png',
          height: 40,
        ),
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () => print("ok"))
      ],
    );
  }
}
