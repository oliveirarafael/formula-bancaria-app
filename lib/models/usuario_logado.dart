import 'package:formula_bancaria_app/models/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioLogado {
  static var _user;

  static void saveUser(Usuario usuario) async{
    UsuarioLogado._user = await SharedPreferences.getInstance();
    UsuarioLogado._user = usuario;
  }

  static Usuario getUser() {
     return UsuarioLogado._user; 
  }
}