import 'package:dio/dio.dart';

abstract class BaseService {
  Dio? dio;

  BaseService() {
    dio = Dio(BaseOptions());
  }
}
