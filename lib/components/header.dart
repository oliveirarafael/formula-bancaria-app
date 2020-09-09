import 'package:flutter/material.dart';

// TODO estudar melhor abordagem para criar Header
class Header {
  AppBar get({Widget leading, Widget actions}) {
    return AppBar(
      backgroundColor: Color(0xFF2A2F52),
      leading: leading == null ? Container() : leading,
      title: Container(
        alignment: Alignment.center,
        child: Image.asset(
          'assets/images/logo/logo-horizontal-branca.png',
          height: 40,
        ),
      ),
      actions: <Widget>[
        actions == null
            ? IconButton(
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
                onPressed: () => print("ok"),
              )
            : actions
      ],
    );
  }
}
