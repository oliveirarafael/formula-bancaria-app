import 'package:formula_bancaria_app/interceptors/auth_interceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

Future<Response> post({String resource, dynamic body}) async {
  Client client = HttpClientWithInterceptor.build(
    interceptors: [
      AuthInterceptor(),
    ],
  );
  return await client.post(
    'http://10.0.1.13:8080/api/v1/${resource}',
    body: body,
    headers: {'Content-Type':'application/json'}
  );
}
