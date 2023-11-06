import 'dart:convert';

import 'package:dio/dio.dart';

Dio _initDio({String? baseUrl, int timeoutMs = 10000}) {
  BaseOptions baseOpts = BaseOptions(
    baseUrl: baseUrl ?? '',
    connectTimeout: Duration(seconds: 30), // 连接服务器超时时间，单位是毫秒
    responseType: ResponseType.plain, // 数据类型
    receiveDataWhenStatusError: true,
  );
  Dio dioClient = Dio(baseOpts); // 实例化请求，可以传入options参数
  // dioClient.interceptors.addAll([
  //   LogsInterceptors(),
  // ]);
  return dioClient;
}

Future<T> safeRequest<T>(
    String url, {
      Object? data,
      Options? options,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
    }) async {
  try {
    return Request.dioClient
        .request(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    )
        .then((data) => jsonDecode(data.data as String) as T);
  } catch (e) {
    rethrow;
  }
}
class Request {
  static Dio dioClient = _initDio();

  static setBaseUrl(String baseUrl) {
    dioClient.options.baseUrl = baseUrl;
  }

  /// get请求
  static Future<T> get<T>(
      String url, {
        Options? options,
        Map<String, dynamic>? queryParameters,
      }) async {
    return safeRequest<T>(
      url,
      options: options,
      queryParameters: queryParameters,
    );
  }

  /// post请求
  static Future<T> post<T>(
      String url, {
        Options? options,
        Object? data,
        Map<String, dynamic>? queryParameters,
      }) async {
    return safeRequest<T>(
      url,
      options: options?.copyWith(method: 'POST') ?? Options(method: 'POST'),
      data: data,
      queryParameters: queryParameters,
    );
  }

  /// put请求
  static Future<T> put<T>(
      String url, {
        Options? options,
        Object? data,
        Map<String, dynamic>? queryParameters,
      }) async {
    return safeRequest<T>(
      url,
      options: options?.copyWith(method: 'PUT') ?? Options(method: 'PUT'),
      data: data,
      queryParameters: queryParameters,
    );
  }
}