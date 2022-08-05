import 'package:dio/dio.dart';

import '../exceptions/NoInternetException.dart';
import 'connectivity_service.dart';

class DioInterceptor extends Interceptor {
  bool _isConnected = false;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    _isConnected = await checkConnectivity();
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode != 200) {
      throw Exception();
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (!_isConnected) {
      err.type = DioErrorType.other;
      err.error = NoInternetException();
    }
    // if(err.response != null && err.response!.statusCode != 200){
    //   err.type = DioErrorType.response;
    // }
    return super.onError(err, handler);
  }
}
