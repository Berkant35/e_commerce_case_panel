import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import '../../main.dart';
import '../config/api_config.dart';
import 'app_exception.dart';

class ApiConnector {
  late Dio _dio;

  /// Initialize
  ApiConnector() {
    logger.i("ApiConnector init...");
    init(ApiConfig.baseUrl, ApiConfig.headers);
  }

  /// initialize the Dio instance
  void init(String baseUrl, Map<String, dynamic>? headers) {
    final baseOptions = BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
      connectTimeout: ApiConfig.connectTimeout,
      receiveTimeout: ApiConfig.receiveTimeout,
      sendTimeout: ApiConfig.sendTimeout,
      responseType: ResponseType.json,
      validateStatus: (status) {
        return status != null && status >= 200 && status < 300;
      },
      contentType: Headers.jsonContentType,
      receiveDataWhenStatusError: true,
    );

    _dio = Dio(baseOptions);
    final interceptor = InterceptorsWrapper(
      onRequest: (options, handler) {
        logger.i('Request: ${options.method} ${options.uri}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        logger.i('Response: ${response.statusCode} ${response.statusMessage}');
        return handler.next(response);
      },
      onError: (e, handler) {
        logger.e('Error: ${e.message}');
        handler.next(e);
      },
    );
    _dio.interceptors.add(interceptor);
  }

  Future<dynamic> get(
    String path, {
    Map<String, String>? body,
    String queryParameters = "",
  }) async {
    try {
      final lPath = createPath(path, queryParameters);
      final response = await _dio.get(lPath, data: body).timeout(
            ApiConfig.crudTimeout,
            onTimeout: () => throw TimeoutException('Connection timed out'),
          );
      return _handleResponse(response);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  Future<dynamic> post(
    String path, {
    required Map<String, dynamic>? body,
    String queryParameters = "",
  }) async {
    try {
      final lPath = createPath(path, queryParameters);
      final response = await _dio.post(lPath, data: body).timeout(
            ApiConfig.crudTimeout,
            onTimeout: () => throw TimeoutException('Connection timed out'),
          );
      return _handleResponse(response);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  //put
  Future<dynamic> put(
    String path, {
    required Map<String, dynamic>? body,
    String queryParameters = "",
  }) async {
    try {
      final lPath = createPath(path, queryParameters);
      final response = await _dio.put(lPath, data: body).timeout(
            ApiConfig.crudTimeout,
            onTimeout: () => throw TimeoutException('Connection timed out'),
          );
      return _handleResponse(response);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  Future<dynamic> delete(
    String path, {
     Map<String, String>? body,
    String queryParameters = "",
  }) async {
    try {
      final lPath = createPath(path, queryParameters);
      final response = await _dio.delete(lPath, data: body).timeout(
            ApiConfig.crudTimeout,
            onTimeout: () => throw TimeoutException('Connection timed out'),
          );
      return _handleResponse(response);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  String createPath(String path, String queryParameters) {
    final tPath = "${_dio.options.baseUrl}$path$queryParameters";
    logger.w("End point with queries: $tPath");
    return tPath;
  }

  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return _convertToJson(response.data);
      case 204:
        return true;
      case 401:
        throw UnauthorisedException(
            'Unauthorized access: ${response.statusMessage}');
      default:
        throw BadRequestException(
            'Error ${response.statusCode}: ${response.statusMessage}');
    }
  }

  dynamic _convertToJson(dynamic responseBody) {
    if (responseBody is String) {
      return json.decode(responseBody);
    } else {
      return responseBody;
    }
  }

  void _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      throw FetchDataException('Timeout occurred');
    } else if (e.type == DioExceptionType.badResponse) {
      final response = e.response;
      if (response != null) {
        _handleResponse(response);
      }
    } else if (e.type == DioExceptionType.cancel) {
      throw InterruptException('Interrupt error: ${e.message}');
    } else if (e.type == DioExceptionType.badCertificate) {
      throw NetworkException('Bad certificate error: ${e.message}');
    } else if (e.type == DioExceptionType.connectionError) {
      throw NetworkException('Connection error: ${e.message}');
    } else if (e.type == DioExceptionType.sendTimeout) {
      throw TimeOutException('Send timeout error: ${e.message}');
    } else if (e.type == DioExceptionType.receiveTimeout) {
      throw TimeOutException('Receive timeout error: ${e.message}');
    } else if (e.type == DioExceptionType.unknown) {
      throw UnknownException('Unknown error: ${e.message}');
    } else {
      throw UnknownException('Unexpected error: ${e.message}');
    }
  }
}
