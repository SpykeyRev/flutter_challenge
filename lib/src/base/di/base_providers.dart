import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Main providers

///This provides the app dio pointing to https://dog.ceo/api
final dioProvider = Provider<Dio>((ref) {
  BaseOptions options = BaseOptions(
    baseUrl: "https://dog.ceo/api",
    headers: kIsWeb?{
      'Accept-Encoding': "gzip, deflate, br",
    }:{},
    connectTimeout: const Duration(milliseconds: 130000),
    receiveTimeout: const Duration(milliseconds: 130000),
  );
  var dio = Dio(options);
  return dio;
});
