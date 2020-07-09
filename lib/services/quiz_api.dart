import 'dart:convert';

import 'package:formula_bancaria_app/models/question.dart';
import 'package:http/http.dart' as http;

class QuizApi {
  static Future<List<Question>> fetch() async {
    try {
      var url = 'https://script.google.com/macros/s/AKfycbyKB4uZjx44XsMne4ZCLgrytBFGqiTOZiP_CUUq2f1cZCSpVvYE/exec';
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return List<Question>.from(
            data["questions"].map((x) => Question.fromMap(x)));
      } else {
        return List<Question>();
      }
      
    } catch (error) {
      print(error);
      return List<Question>();
    }
  }
}