import 'package:flutter/material.dart';

class TextFieldFB extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;

  final String label;
  final bool enabled;

  TextFieldFB({@required this.controller, 
               @required this.label, 
                         this.enabled, 
                         this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      keyboardType: this.keyboardType == null ? TextInputType.text : this.keyboardType,
      enabled: this.enabled,
      decoration: InputDecoration(
          labelText: this.label,
          labelStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black38,
          )),
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }
}