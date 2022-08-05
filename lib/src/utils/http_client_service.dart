import 'package:dio/dio.dart';

import 'dio_interceptor.dart';

class HttpClientService {
  static HttpClientService? _instance;
  late Dio _dio;

  Dio getDio(String baseUrl)  {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 10000,
        sendTimeout: 15000,
        receiveTimeout: 15000,
      ),
    )..interceptors.add(
        DioInterceptor(),
      );
    return _dio;
  }

  HttpClientService._();

  factory HttpClientService() {
    _instance ??= HttpClientService._();
    return _instance!;
  }
}
