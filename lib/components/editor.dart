import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String label;
  final double fontSize;

  Editor({this.controlador, this.label, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: this.fontSize == null ? 24.0 : this.fontSize,
        ),
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }
}