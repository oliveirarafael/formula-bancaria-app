import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:formula_bancaria_app/models/auth.dart';
import 'package:formula_bancaria_app/models/usuario.dart';
import 'package:formula_bancaria_app/models/usuario_logado.dart';
import 'package:http_interceptor/http_interceptor.dart';

class AuthInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print(
        '========================== Request ====================================');
    print(data.url);
    print(data.method);
    if (data.url.contains('auth') ||
        data.url.contains('esqueceu-senha') ||
        data.url.contains('usuarios/alunos')) {
      return data;
    }
    print(data.body);
    //print(data.headers);
    //print(
    //  '========================== Request ====================================');
    data.headers['Authorization'] = 'Bearer ${Auth.token()}';
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    //print('========================== Response ====================================');
    if (data.statusCode == 200 && data.body.contains('token')) {
      debugPrint('Token Armazenado');
      dynamic jsonResponse = jsonDecode(data.body);
      Auth.saveToken(jsonResponse['token']);
      UsuarioLogado.saveUser(Usuario.fromJson(jsonResponse['usuario']));
    }
    /* print(data.headers);*/
    //print(data.body);
    //print('========================== Response ====================================');
    return data;
  }
}
