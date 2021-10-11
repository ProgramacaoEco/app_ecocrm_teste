import 'package:dio/dio.dart';

class CustomDio {
  static CustomDio _simpleInstance;
  Dio _dio;

  BaseOptions options = BaseOptions(
    baseUrl: 'https://api.ecoteste.crmwin.eco.br/public/api/',
    connectTimeout: 60000,
    receiveTimeout: 60000,
  );

  CustomDio._() {
    _dio = Dio(options);
  }

  static Dio get instance {
    _simpleInstance ??= CustomDio._();
    return _simpleInstance._dio;
  }
}
