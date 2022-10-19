import 'package:dio/dio.dart';
import 'package:nums/common/api/api_urls.dart';

const String CONCRETE_NUMBER = "CONCRETE_NUMBER";

class ApiConfig {
  static Dio dio = createDio();

  static Dio createDio() => Dio(BaseOptions(
        connectTimeout: 10000,
        receiveTimeout: 10000,
        baseUrl: ApiUrls.BASE_URL,
      ))
        ..interceptors.add(AppInterceptor());
}

class AppInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.extra[CONCRETE_NUMBER] != null) {
      options.path = "${options.path}${options.extra[CONCRETE_NUMBER]}";
    }
    super.onRequest(options, handler);
  }
}
