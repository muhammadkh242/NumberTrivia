import 'package:dio/dio.dart';
import 'package:nums/common/api/api_urls.dart';

class ApiConfig {
  static Dio dio = createDio();

  static Dio createDio() => Dio(BaseOptions(
        connectTimeout: 10000,
        receiveTimeout: 10000,
        baseUrl: ApiUrls.BASE_URL,
      ));
}


