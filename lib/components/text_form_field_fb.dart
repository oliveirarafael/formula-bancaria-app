import 'package:flutter/material.dart';

class TextFormFieldFB extends StatelessWidget {
  String _value, _label;
  TextInputType _keyboardType;

  TextFormFieldFB({@required String value, 
                   @required String label, 
                   TextInputType keyboardType}){
                     
    this._value = value;
    this._label = label;
    this._keyboardType = keyboardType;
  }
  
  @override
  Widget build(BuildContext context) {
    
    return TextFormField(
      onSaved: (value) {
        this._value = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Campo Obrigatório';
        }
      },
      keyboardType: this._keyboardType == null ? TextInputType.text : this._keyboardType,
      decoration: InputDecoration(
          labelText: this._label,
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