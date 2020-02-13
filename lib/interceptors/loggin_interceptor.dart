import 'package:flutter/widgets.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    debugPrint('****** Resquest ********');
    debugPrint('url: ${data.url}');
    debugPrint('body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
      debugPrint('****** Response ********');
      debugPrint('body: ${data.headers}');
      debugPrint('body: ${data.body}');
      return data;
  }
}