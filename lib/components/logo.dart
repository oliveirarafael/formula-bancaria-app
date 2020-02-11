import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double width, height;

  Logo({this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: this.width,
      height: this.height,
      child: Image.asset('assets/images/logo-horizontal-colorida-300x103.png'),
    );
  }
}
