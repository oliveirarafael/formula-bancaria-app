import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:formula_bancaria_app/models/auth.dart';
import 'package:http_interceptor/http_interceptor.dart';

class AuthInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    debugPrint('****** Resquest ********');
    debugPrint('url: ${data.url}');
    //debugPrint('body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
      //debugPrint('****** Response ********');
      //debugPrint('body: ${data.headers}');
      //debugPrint('body: ${data.body}');
      if(data.statusCode == 200 && data.body.contains('token')){
        debugPrint('Token Armazenado');
        dynamic jsonResponse = jsonDecode(data.body);
        Auth.save(jsonResponse['token']);
      }
      return data;
  }
}