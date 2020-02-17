import 'package:formula_bancaria_app/interceptors/auth_interceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

final int STATUS_CREATED = 201;
final int STATUS_OK = 200;
final int STATUS_NOT_FOUND = 404;

Client _client = HttpClientWithInterceptor.build(
    interceptors: [
      AuthInterceptor(),
    ],
    requestTimeout: Duration(seconds: 20),
);

const String _baseUrl = 'http://192.168.0.23:8080/api/v1';

Future<Response> post({String resource, dynamic body}) async {
  return await _client.post(
    '$_baseUrl/${resource}',
    body: body,
    headers: {
      'Content-Type': 'application/json',
    },
  );
}

Future<Response> get(String resource) async {
  return await _client.get('$_baseUrl/${resource}');;
}
