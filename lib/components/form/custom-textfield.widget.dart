import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  TextInputType inputType;
  IconData icon;
  String placeholder;
  String value;
  Function(String) validationFunction;

  CustomTextField({
    @required this.inputType,
    @required this.icon,
    @required this.placeholder,
    @required this.value,
    @required this.validationFunction
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //autofocus: true,
      onSaved: (value) {
        this.value = value;
      },
      initialValue: (placeholder == 'Senha') ? "123456" : 'user@email.com.br',
      validator: validationFunction,
      keyboardType: inputType,
      obscureText: (placeholder == 'Senha'),
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: placeholder,
          filled: true,                 // Novo
          fillColor: Color(0xFFDBEDFF), // Novo
          prefixIcon: Icon(icon, color: Theme.of(context).scaffoldBackgroundColor),
          enabledBorder: OutlineInputBorder( // Novo
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder( // Novo
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelStyle: TextStyle(
            fontSize: 20,
            color: Theme.of(context).scaffoldBackgroundColor
          )
        ),
      style: TextStyle(
        fontSize: 20,
        color: Theme.of(context).scaffoldBackgroundColor
      ),
    );
  }
}