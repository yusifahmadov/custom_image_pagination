import 'package:dio/dio.dart';

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Authorization'] =
        'Client-ID wdldAPwV9TK6_sLuUo5LwmbL91c0-OVipttZCWL5qWg';

    handler.next(options);
  }
}
