import 'package:dio/dio.dart';
import 'package:ecommerce/core/errors/exceptions.dart';
import 'package:ecommerce/core/network/api_consumer.dart';
import 'package:ecommerce/core/network/end_points.dart';
import 'package:ecommerce/core/utils/storage_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

token() async {
  final token = await StorageHelper().getToken(key: ApiKeys.token);
}

class DioConsumer extends ApiConsumer {
  final Dio dio;
  DioConsumer({required this.dio}) {
    dio.options.baseUrl = ApiEndpoints.baseUrl;
    dio.interceptors.add(PrettyDioLogger(request: true, requestHeader: true));
  }

  @override
  get(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Response response = await dio.get(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: {ApiKeys.token: "Bearer${token()}"}),
    );
    return response.data;
  }

  @override
  post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      Response response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  delete(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    Response response = await dio.delete(
      path,
      data: isFormData ? FormData.fromMap(data) : data,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  @override
  patch(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool isFormData = false,
  }) async {
    Response response = await dio.patch(
      path,
      data: isFormData ? FormData.fromMap(data) : data,
      queryParameters: queryParameters,
    );
    return response.data;
  }
}
