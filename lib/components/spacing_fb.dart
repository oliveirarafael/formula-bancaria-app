import 'package:flutter/material.dart';

class SpacingFB extends StatelessWidget {
  
  final double height;

  SpacingFB({@required this.height}); 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: this.height,
    );
  }
}