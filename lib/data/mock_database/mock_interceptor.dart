import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class MockInterceptor extends Interceptor {
  static const _jsonDir = "assets/json";
  static const _jsonExtension = ".json";

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final resourcePath = _jsonDir + options.path + _jsonExtension;
    final data = await rootBundle.load(resourcePath);
    print(data);
    final map = json.decode(utf8.decode(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes)));

    print(map);
    return Response(requestOptions: options, data: map, statusCode: 200);
  }
}
