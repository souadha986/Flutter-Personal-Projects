import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/networking/endpoints.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  Dio? dio;
  DioHelper() {
    dio ??= Dio(
      BaseOptions(baseUrl: EndPoints.baseUrl, receiveDataWhenStatusError: true),
    );
    dio!.interceptors.add(PrettyDioLogger());
  }

  Future getrequest({
    required String endpoints,
    Map<String, dynamic>? data,
  }) async {
    try {
      Response response = await dio!.get(endpoints, queryParameters: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future postrequest({
    required String endpoints,
    required Map<String, dynamic> data,
  }) async {
    try {
      Response response = await dio!.post(endpoints, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future putrequest({
    required String endpoints,
    required Map<String, dynamic> data,
  }) async {
    try {
      Response response = await dio!.put(
        endpoints,
        data: data,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
