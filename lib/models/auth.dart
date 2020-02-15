import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  static var _token;

  static void save(String token) async{
     Auth._token = await SharedPreferences.getInstance();
     Auth._token.setString('token', token);
  }

  static String token(){
     return Auth._token.getString('token'); 
  }
}