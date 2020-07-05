
import 'package:formula_bancaria_app/interceptors/auth_interceptor.dart';
import 'package:formula_bancaria_app/models/auth.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';

Client _client = HttpClientWithInterceptor.build(
    interceptors: [
      AuthInterceptor(),
    ],
    requestTimeout: Duration(seconds: 20),
);

class BaseService {
  final String baseUrl = 'https://formula-bancaria-api.herokuapp.com/api/v1';

  Future<Response> post({String resource, dynamic body}) async {
    return await _client.post(
      '$baseUrl/$resource',
      body: body,
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }

  Future<Response> postWithToken({String resource, dynamic body}) async {
    return await _client.post(
      '$baseUrl/$resource',
      body: body,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer' + Auth.token(),
      },
    );
  }
}