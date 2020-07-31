import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final height;

  Logo({this.height});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/logo/logo-colorida.png',
        height: this.height);
  }
}
