import 'package:dio/dio.dart';

abstract class INetworkService {
  Dio? dio;

  INetworkService() {
    dio = Dio(BaseOptions());
  }
}
