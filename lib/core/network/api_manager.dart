import 'package:dio/dio.dart';
import 'package:technaureus_machine_test/core/network/base_response.dart';

class ApiManager {
  final Dio _dio = Dio();
  final String _baseUrl = 'http://143.198.61.94:8000/';

  ApiManager() {
    _dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
      ),
    );
  }

  // Generic function to handle GET requests
  Future<BaseResponse> get(
    String path,
    {Map<String, dynamic>? queryParameters}
  ) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      return BaseResponse.fromJson(response.data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  // Generic function to handle POST requests
  Future<BaseResponse> post(
    String path, {
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await _dio.post(path, data: data);
      return BaseResponse.fromJson(response.data);
    } catch (e) {
      throw _handleError(e);
    }
  }

 Future<BaseResponse> put(
    String path,
    {Map<String, dynamic>? queryParameters}
  ) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      return BaseResponse.fromJson(response.data);
    } catch (e) {
      throw _handleError(e);
    }
  }


  // Handle Dio errors
  dynamic _handleError(error) {
    if (error is DioException) {
      // Handle Dio specific errors
      return error.message;
    } else {
      // Handle other errors
      return 'Unexpected error occurred';
    }
  }
}
