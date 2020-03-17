import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:formula_bancaria_app/models/auth.dart';
import 'package:http_interceptor/http_interceptor.dart';

class AuthInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print(data.url);
    print(data.method);
    if (!data.url.contains('auth')) {
      data.headers['Authorization'] = 'Bearer ${Auth.token()}';
    }
    print(data.body);
    print(data.headers);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    if(data.statusCode == 200 && data.body.contains('token')) {
      debugPrint('Token Armazenado');
      dynamic jsonResponse = jsonDecode(data.body);
      Auth.saveToken(jsonResponse['token']);
    }
    print(data.headers);
    print(data.body);
    return data;
  }
}
