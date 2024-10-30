

import 'dart:io';


import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'logging_interceptor.dart';

class DioClient{
  final String baseUrl;
  final LoggingInterceptor loggingInterceptor;
  final SharedPreferences sharedPreferences;

  Dio? dio;
  String? token;
  String? countryCode;


  DioClient(this.baseUrl,Dio? dioC,{required this.loggingInterceptor,required this.sharedPreferences,}){

    dio = dioC ?? Dio();
    dio!
    ..options.baseUrl = baseUrl
    ..options.connectTimeout = const Duration(milliseconds: 30000)
    ..options.receiveTimeout = const Duration(milliseconds: 30000)
    ..httpClientAdapter
    ..options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      //AppConstants.LANG_KEY : countryCode == 'US'? 'en':countryCode.toLowerCase(),
    };
    dio!.interceptors.add(loggingInterceptor);

  }

  /// Update Header
  void updateHeader(String token) {
    token = (token);
    this.token = token;
    if (kDebugMode) {
      print('===Token====>$token');
    }

    dio?.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }


  Future<Response> get(String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio!.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }


  Future<Response> post(String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio!.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }


  Future<Response> put(String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio!.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }


  Future<Response> delete(String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await dio!.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

}